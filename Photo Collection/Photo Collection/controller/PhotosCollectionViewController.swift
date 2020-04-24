//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Vincent Hoang on 4/23/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import UIKit
import os.log

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "photoViewCell")

        // Do any additional setup after loading the view.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch segue.identifier ?? "" {
        case "addPhotoSegue":
            os_log("Add photo button pressed", log: OSLog.default , type: .debug)
            
        case "showPhotoSegue":
            os_log("Photo view cell pressed", log: OSLog.default , type: .debug)
            guard let photoDetailViewController = segue.destination as? PhotoDetailViewController else {
                fatalError("Invalid segue destination: \(segue.destination)")
            }
            
            guard let selectedPhotoCell = sender as? PhotosCollectionViewCell else {
                fatalError("Unexpected sender: \(sender ?? "No sender available")")
            }
            
            guard let indexPath = collectionView.indexPath(for: selectedPhotoCell) else {
                fatalError("The selected cell is not being displayed by the collection view")
            }
            
            let selectedPhoto = photoController.photos[indexPath.row]
            photoDetailViewController.photo = selectedPhoto
            
        default:
            fatalError("Invalid segue identifier: \(segue.identifier ?? "No segue identifier available")")
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoViewCell", for: indexPath) as? PhotosCollectionViewCell else {
            fatalError("Dequeued cell is not an instance of PhotoDetailViewCell")
        }
    
        // Configure the cell
    
        cell.photo = photoController.photos[indexPath.row]
        
        return cell
    }
    
    func setTheme() {
        if themeHelper.themePreference == "light" {
            collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        if themeHelper.themePreference == "dark" {
            collectionView.backgroundColor = #colorLiteral(red: 0.1613258421, green: 0.1613600552, blue: 0.161321342, alpha: 1)
        }
    }
    
    @IBAction func unwindToPhotoCollection(_ sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? PhotoDetailViewController, let photo = sourceViewController.photo {
            
            if let selectedIndexPaths = collectionView.indexPathsForSelectedItems, let selectedIndexPath = selectedIndexPaths.first?.row {
                photoController.photos[selectedIndexPath] = photo
            } else {
                photoController.createPhoto(photo.imageData, photo.title)
            }
            collectionView.reloadData()
        }
    }

}

