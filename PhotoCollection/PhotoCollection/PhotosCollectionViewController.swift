//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Thomas Cacciatore on 5/9/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {

  
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddPhoto" {
            guard let addDetailVC = segue.destination as? PhotoDetailViewController else { return }
            addDetailVC.photoController = photoController
            addDetailVC.themeHelper = themeHelper
        } else if segue.identifier == "Detail" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController  else { return }
            guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
            let photo = photoController.photos[indexPath.item]
            
            photoDetailVC.photoController = photoController
            photoDetailVC.themeHelper = themeHelper
            photoDetailVC.photo = photo
        } else if segue.identifier == "Theme" {
            guard let themeSelectionVC = segue.destination as? ThemeSelectionViewController else { return }
            
            themeSelectionVC.themeHelper = themeHelper
        }
        
    }
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        
        if themePreference == "Dark" {
            collectionView.backgroundColor = .gray
        } else if themePreference == "Orange" {
            collectionView.backgroundColor = .orange
        }
    }
 

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell
    
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        return cell
    }

  
    
    var photoController = PhotoController()
    var themeHelper = ThemeHelper()
    
}
