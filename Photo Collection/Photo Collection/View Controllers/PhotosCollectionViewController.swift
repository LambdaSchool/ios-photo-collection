//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by macbook on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    // MARK: - Instances of other files
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == String.showPhotoSegue {
            
            if let photoDetailVC = segue.destination as? PhotoDetailViewController,
                let indexPath = collectionView?.indexPathsForSelectedItems?.first {
                
                photoDetailVC.themeHelper = themeHelper
                photoDetailVC.photoController = photoController
                photoDetailVC.photo = photoController.photos[indexPath.row]
            }
            
                
        } else if segue.identifier == String.addNewPhotoSegue {
            
            if let photoDetailVC = segue.destination as? PhotoDetailViewController {
                photoDetailVC.themeHelper = themeHelper
                photoDetailVC.photoController = photoController
            }
            
        } else if segue.identifier == String.selectThemeSegue {
            
            if let themeSelectionVC = segue.destination as? ThemeSelectionViewController {
                themeSelectionVC.themeHelper = themeHelper
                
            }
        }
 
    }
 

    // MARK: UICollectionViewDataSource
//      I think this should default to 1 **
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
    
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
    
    func setTheme() {
        guard let theme = themeHelper.themePreference else { return }
        
        if theme == "Dark" {
            collectionView.backgroundColor = .darkGray
        }
        else if theme == "Green" {
            collectionView.backgroundColor = .green
        } else { return }
        
    }
    
    

}
