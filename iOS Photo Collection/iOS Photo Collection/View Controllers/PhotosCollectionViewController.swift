//
//  PhotosCollectionViewController.swift
//  iOS Photo Collection
//
//  Created by Steven Leyva on 7/25/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setTheme()
    }

    //
    // MARK: - Navigation
    //
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDetailSegue" {
            guard let showDetailVC = segue.destination as? PhotoDetailViewController,
                  let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
            showDetailVC.themeHelper = themeHelper
            showDetailVC.photoController = photoController
            showDetailVC.photo = photoController.photos[indexPath.item]
            
        }else if segue.identifier == "AddPhotoSegue" {
            guard let addPhotoVC = segue.destination as? PhotoDetailViewController else { return }
            addPhotoVC.themeHelper = themeHelper
            addPhotoVC.photoController = photoController
            
        }else if segue.identifier == "SelectThemeSegue" {
            guard let selectThemeVC = segue.destination as? ThemeSelectionViewController else { return }
            selectThemeVC.themeHelper = themeHelper
            
        }
    
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell()}
    
        // Configure the cell
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        
    
        return cell
    }
    
    func setTheme() {
        guard let theme = themeHelper.themePreference else { return }
        
        if theme == "Dark" {
            collectionView.backgroundColor = .darkGray
        } else if theme == "Blue" {
            collectionView.backgroundColor = .blue
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
}
