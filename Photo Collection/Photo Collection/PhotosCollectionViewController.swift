//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Moses Robinson on 1/16/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddPhoto" {
            guard let addDetailVC = segue.destination as? PhotoDetailViewController else { return }
            
            addDetailVC.photoController = photoController
            addDetailVC.themeHelper = themeHelper
            
        } else if segue.identifier == "PhotoDetail" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController,
                let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
            let photo = photoController.photos[indexPath.item]
            
            photoDetailVC.photoController = photoController
            photoDetailVC.themeHelper = themeHelper
            photoDetailVC.photo = photo
            
        } else if segue.identifier == "ThemeSelect" {
            guard let themeSelectionVC = segue.destination as? ThemeSelectionViewController else { return }
            
            themeSelectionVC.themeHelper = themeHelper
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell
        
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        
        return cell
    }
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        
        if themePreference == "Dark" {
            collectionView.backgroundColor = #colorLiteral(red: 0.6466435194, green: 0.6634457111, blue: 0.7351312041, alpha: 1)
        } else if themePreference == "Purple" {
            collectionView.backgroundColor = #colorLiteral(red: 0.5076087117, green: 0.5245476365, blue: 0.9441453815, alpha: 1)
        }
    }
    
    //MARK: - Properties
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
}
