//
//  PhotoCollectionViewController.swift
//  PhotoCollection
//
//  Created by Stuart on 1/16/19.
//  Copyright © 2019 Stuart. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotoCollectionViewController: UICollectionViewController {
    
    // MARK: - Set Theme
    
    func setTheme() {
        
        if let currentTheme = themeHelper.themePreference {
            if currentTheme == "Cyan" {
                self.collectionView?.backgroundColor = .cyan
            } else if currentTheme == "Dark" {
                self.collectionView?.backgroundColor = .gray
            }
        }
    }
    
    // MARK: - Lifecycle Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
        setTheme()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoCellSegue" {
            guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
            
            destinationVC.themeHelper = themeHelper
            destinationVC.photoController = photoController
            
            guard let cell = sender as? PhotoCollectionViewCell,
                let index = collectionView?.indexPath(for: cell) else { return }
            
            let photo = photoController.photos[index.item]
            destinationVC.photo = photo
            
        } else if segue.identifier == "AddButtonSegue" {
            guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
            
            destinationVC.themeHelper = themeHelper
            destinationVC.photoController = photoController
            
        } else if segue.identifier == "ThemeSelectSegue" {
            guard let destinationVC = segue.destination as? ThemeSelectionViewController else { return }
            
            destinationVC.themeHelper = themeHelper
        }
    }

    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        
        let photo = photoController.photos[indexPath.row]
        
        cell.imageLabel.text = photo.title
        cell.imageView.image = UIImage(data: photo.imageData)
        
        return cell
    }
    
    // IBOutlets & Properties
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
}
