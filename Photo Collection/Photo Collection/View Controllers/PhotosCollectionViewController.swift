//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Rob Vance on 4/29/20.
//  Copyright © 2020 Robs Creations. All rights reserved.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {

    // Setting an instance of ...
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView.reloadData()
        setTheme()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhotoSegue" {
            if let addPhotoVC = segue.destination as? PhotoDetailViewController {
                addPhotoVC.themeHelper = self.themeHelper
                addPhotoVC.photoController = self.photoController
            }
        } else if segue.identifier == "PhotoDetailSegue" {
            guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
            if let photoDetailVC = segue.destination as? PhotoDetailViewController {
                photoDetailVC.themeHelper = self.themeHelper
                photoDetailVC.photoController = self.photoController
                photoDetailVC.photo = self.photoController.photos[indexPath.item]
            }
        } else if segue.identifier == "SelectThemeSegue" {
            if let selectThemeVC = segue.destination as? ThemeSelectionViewController {
                selectThemeVC.themeHelper = self.themeHelper
                selectThemeVC.modalPresentationStyle = .overCurrentContext
            }
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        let photo = photoController.photos[indexPath.item]
        cell.photoImageView.image = UIImage(data: photo.imageData)
        cell.photoNameLabel.text = photo.title
        
        return cell
    }
    func setTheme() {
        if let themeSelection = themeHelper.themePreference {
            if themeSelection == "Dark" {
                collectionView.backgroundColor = UIColor.darkGray
            } else if themeSelection == "Green" {
                collectionView.backgroundColor = UIColor.green
            }
        }
    }


}
