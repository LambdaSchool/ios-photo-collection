//
//  PhotoCollectionViewController.swift
//  Photo Collection
//
//  Created by Stuart on 1/23/19.
//  Copyright © 2019 Stuart. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController {
    
    // MARK: - Set Theme
    
    func setTheme() {
        if let currentTheme = themeHelper.themePreference {
            if currentTheme == "Aqua" {
                self.collectionView?.backgroundColor = .blue
            } else if currentTheme == "Dark" {
                self.collectionView?.backgroundColor = .black
            }
        }
    }
    
    // MARK: - Lifecycle Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
        setTheme()
    }
    
    // MARK: - CollectionViewControllerDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath)
        
        guard let photoCell = cell as? PhotoCollectionViewCell else { return cell }
        let photo = photoController.photos[indexPath.item]
        
        photoCell.imageView.image = photo.imageData//UIImage(data: photo.imageData)
        photoCell.imageLabel.text = photo.title
        
        return photoCell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoCellSegue" {
            guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
            
            guard let photoCell = sender as? PhotoCollectionViewCell,
                  let indexPath = collectionView?.indexPath(for: photoCell) else { return }
            
            let photo = photoController.photos[indexPath.item]
            
            destinationVC.imageView.image = photo.imageData//UIImage(data: photo.imageData)
        }
    }
    
    // MARK: - Properties
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
}
