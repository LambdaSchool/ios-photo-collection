//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Scott Bennett on 9/13/18.
//  Copyright © 2018 Scott Bennett. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
        setTheme()
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell()}
    
        let photo = photoController.photos[indexPath.item]
        cell.imageLabel.text = photo.title
        cell.imageView.image = UIImage(data: photo.imageData)
    
        return cell
    }
    
    
    //
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        
        switch themePreference {
        case "Dark":
            collectionView?.backgroundColor = .darkGray
        default:
            collectionView?.backgroundColor = .lightGray
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Cell segue - pass themeController, photoController and the photo
        if segue.identifier == "ShowDetail" {
            guard let destinationVC = segue.destination as? PhotoDetailViewController,
                let indexPaths = collectionView?.indexPathsForSelectedItems,
                let indexPath = indexPaths.first else { return }
            let photo = photoController.photos[indexPath.item]
            destinationVC.themeHelper = themeHelper
            destinationVC.photoController = photoController
            destinationVC.photo = photo
            
            // Add Photo segue - pass themeController and PhotoController
        } else if segue.identifier == "AddPhoto" {
            guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
            destinationVC.themeHelper = themeHelper
            destinationVC.photoController = photoController
            
            // Select Theme segue - pass themeController
        }else if segue.identifier == "SelectTheme" {
            guard let destinationVC = segue.destination as? ThemeSelectionViewController else { return }
            destinationVC.themeHelper = themeHelper
        }
        
    }

}
