//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Lydia Zhang on 2/27/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidAppear(_ animated: Bool) {
        setTheme()
        collectionView.reloadData()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "SelectTheme" {
            if let selectThemeVC = segue.destination as? ThemeSelectionViewController {
                selectThemeVC.themeHelper = self.themeHelper
            } else if segue.identifier == "AddPhoto" {
                if let addPhotoVC = segue.destination as? PhotoDetailViewController {
                    addPhotoVC.photoController = self.photoController
                    addPhotoVC.themeHelper = self.themeHelper
                }
            } else if segue.identifier == "PhotoDetail" {
                guard let detailVC = segue.destination as? PhotoDetailViewController,
                    let indexPath = collectionView.indexPathsForSelectedItems?.first else { return
                        
                }
                detailVC.photo = photoController.photos[indexPath.item]
                detailVC.themeHelper = self.themeHelper
                    
                
            }
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { fatalError("Cell is not a Photo Cell")}
    
        // Configure the cell
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
    
        return cell
    }
    
    func setTheme() {
        guard let themeHelper = themeHelper.themePreference else {return}
        
        if themeHelper == "Dark" {
            collectionView.backgroundColor = .darkGray
        } else if themeHelper == "Purple" {
            collectionView.backgroundColor = .purple
        }
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
