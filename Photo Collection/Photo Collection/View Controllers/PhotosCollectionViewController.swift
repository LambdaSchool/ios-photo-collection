//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Juan M Mariscal on 2/20/20.
//  Copyright © 2020 Juan M Mariscal. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        
        let photo = photoController.photos[indexPath.item]
        cell.photoImageView.image = UIImage(data: photo.imageData)
        cell.photoLabel.text = photo.title
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */
    
    func setTheme() {
        if let selectedTheme = themeHelper.themePreference {
            if (selectedTheme == "Dark") {
                collectionView.backgroundColor = UIColor.darkGray
            } else if (selectedTheme == "Blue") {
                collectionView.backgroundColor = UIColor.cyan
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ThemeSelectionSegue" {
            if let addTSVC = segue.destination as? ThemeSelectionViewController {
                addTSVC.themeHelper = self.themeHelper
                
            }
            
        } else if segue.identifier == "AddPhotoDetailSegue" {
            if let addAPVC = segue.destination as? PhotoDetailViewController {
                addAPVC.themeHelper = self.themeHelper
                addAPVC.photoController = self.photoController
            }
        } else if segue.identifier == "PhotoSelectedDetailSegue" {
            guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
            if let selectedPhotoVC = segue.destination as? PhotoDetailViewController {
                selectedPhotoVC.themeHelper = self.themeHelper
                selectedPhotoVC.photoController = self.photoController
                selectedPhotoVC.photo = self.photoController.photos[indexPath.item]
            }
        }
    }


}
