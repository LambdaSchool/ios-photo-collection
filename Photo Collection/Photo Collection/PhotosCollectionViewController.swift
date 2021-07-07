//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Moin Uddin on 9/6/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setTheme()
        collectionView?.reloadData()
    }



    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "AddPhoto"){
            guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
            destinationVC.photoController = photoController
            destinationVC.themeHelper = themeHelper
        } else if(segue.identifier == "ShowPhoto") {
            guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
            destinationVC.themeHelper = themeHelper
            destinationVC.photoController = photoController
            guard let indexPath = collectionView?.indexPathsForSelectedItems?.first else { return }
            destinationVC.photo = photoController.photos[indexPath.item]
        }else if(segue.identifier == "SelectTheme") {
            guard let destinationVC = segue.destination as? ThemeSelectionViewController else { return }
            destinationVC.themeHelper = themeHelper
        }
    }
 

    // MARK: UICollectionViewDataSource

    func setTheme() {
        guard let color =  themeHelper.themePreference else { return }
        switch color {
        case "Blue":
            collectionView?.backgroundColor = UIColor.blue
        case "Dark":
            collectionView?.backgroundColor = UIColor.darkGray
        default:
            return
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        cell.photo = photoController.photos[indexPath.item]
    
        // Configure the cell
    
        return cell
    }

    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

}
