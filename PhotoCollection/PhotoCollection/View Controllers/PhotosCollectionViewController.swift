//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by John Kouris on 8/15/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPhotoDetailSegue" {
            guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
            destinationVC.themeHelper = themeHelper
            destinationVC.photoController = photoController
            
            guard let photoIndex = collectionView.indexPathsForSelectedItems?.first?.item else { return }
            let photo = photoController.photos[photoIndex]
            destinationVC.photo = photo
        } else if segue.identifier == "AddNewPhotoSegue" {
            guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
            destinationVC.themeHelper = themeHelper
            destinationVC.photoController = photoController
        } else if segue.identifier == "ShowThemeSelectorSegue" {
            guard let destinationVC = segue.destination as? ThemeSelectionViewController else { return }
            destinationVC.themeHelper = themeHelper
        }
    }

    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        
        return cell
    }
    
    // MARK: - Private functions
    
    func setTheme() {
        guard let currentTheme = themeHelper.themePreference else { return }
        
        if currentTheme == "Dark" {
            collectionView.backgroundColor = .darkGray
        } else if currentTheme == "Blue" {
            collectionView.backgroundColor = .blue
        }
        
    }
    
}
