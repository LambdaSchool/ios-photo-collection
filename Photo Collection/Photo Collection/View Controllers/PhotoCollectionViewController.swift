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
    
    // MARK: - CollectionViewControllerDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath)
        
        guard let photoCell = cell as? PhotoCollectionViewCell else { return cell }
        let photo = photoController.photos[indexPath.item]
        
        photoCell.imageView.image = UIImage(data: photo.imageData)
        photoCell.imageLabel.text = photo.title
        
        return photoCell
    }
    
    // MARK: - Properties
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
}
