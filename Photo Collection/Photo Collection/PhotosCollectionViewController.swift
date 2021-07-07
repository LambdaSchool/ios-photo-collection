//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Daniela Parra on 9/6/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCollectionViewCell
    
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
    
        return cell
    }

    func setTheme() {
        let themePreference = themeHelper.themePreference
        if themePreference == nil { return }
        
        if themePreference == "Dark" {
            collectionView?.backgroundColor = UIColor.lightgray
        } else if themePreference == "Yellow" {
            collectionView?.backgroundColor = UIColor.yellow
        }
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewPhoto" {
            guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
            
            guard let indexPaths = collectionView?.indexPathsForSelectedItems,
                let indexPath = indexPaths.first else { return }
            let photo = photoController.photos[indexPath.item]
            
            destinationVC.photoController = photoController
            destinationVC.photo = photo
            destinationVC.themeHelper = themeHelper
            
            
        } else if segue.identifier == "AddPhoto" {
            guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
            
            destinationVC.photoController = photoController
            
        } else if segue.identifier == "SetTheme" {
            guard let destinationVC = segue.destination as? ThemeSelectionViewController else { return }
            
            destinationVC.themeHelper = themeHelper
        }
    }
    
    let themeHelper = ThemeHelper()
    let photoController = PhotoController()

}
