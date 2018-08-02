//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Linh Bouniol on 8/2/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    var photoController = PhotoController()
    var themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
//        self.collectionView!.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell")
        // If you didn't set the class in storyboard, then you need to do it here

    }

    // MARK: - Theme Selection
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        
        if themePreference == "Red" {
            collectionView?.backgroundColor = UIColor.red
        } else {
            collectionView?.backgroundColor = UIColor.darkGray
            
        }
        
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Segue from cell
        if let detailVC = segue.destination as? PhotoDetailViewController {
            detailVC.photoController = photoController
            detailVC.themeHelper = themeHelper
            
            if segue.identifier == "ShowPhotoDetail" {
                guard let index = collectionView?.indexPathsForSelectedItems?.first?.item else { return }
                
                let photo = photoController.photos[index]
                detailVC.photo = photo
            }
            
//            else if segue.identifier == "ShowAddPhoto" {
//
//            }
                // Since there is no code here, dont really need to have this
        }
        
//        // Segue from add button
//        if let showAddPhotoDetailVC = segue.destination as? PhotoDetailViewController {
//            showAddPhotoDetailVC.photoController = photoController
//            showAddPhotoDetailVC.themeHelper = themeHelper
//        }
            // Can't do this separately because two different segues both go to the same type of destination view controller.
        
        // Segue from select theme button
        if let showSelectThemeVC = segue.destination as? ThemeSelectionViewController {
            showSelectThemeVC.themeHelper = themeHelper
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotosCollectionViewCell
        
        let photo = photoController.photos[indexPath.item]
        
        cell.imageView?.image = UIImage(data: photo.imageData)
        cell.textLabel?.text = photo.title
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
