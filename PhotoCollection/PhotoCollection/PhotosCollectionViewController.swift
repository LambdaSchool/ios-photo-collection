//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Jonathan Ferrer on 5/2/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    let photo: Photo? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowPhoto" {
            let cellVC: PhotoDetailViewController = segue.destination as! PhotoDetailViewController
            cellVC.themeHelper = themeHelper
            cellVC.photoController = photoController
            //TODO: Fix photo
            cellVC.photo = photo
        } else if segue.identifier == "AddPhoto" {
            let addVC: PhotoDetailViewController = segue.destination as! PhotoDetailViewController
            addVC.themeHelper = themeHelper
            addVC.photoController = photoController
        } else if segue.identifier == "SelectTheme" {
            let selectVC: ThemeSelectionViewController = segue.destination as! ThemeSelectionViewController
            selectVC.themeHelper = themeHelper
        }
    }
 

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return photoController.photos.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell()}
        let photo = photoController.photos[indexPath.item]
        
        cell.imageView.image = UIImage(data: photo.imageData)
        cell.imageLabel.text = photo.title
        // Configure the cell
    
        return cell
    }
    
    func setTheme() {
        let theme = themeHelper.themePreference
        
        if theme == "Dark" {
            self.view.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        } else {
            self.view.backgroundColor = #colorLiteral(red: 0.2272256538, green: 0.5468909038, blue: 0.9551692034, alpha: 1)
        }
    }

 

}
