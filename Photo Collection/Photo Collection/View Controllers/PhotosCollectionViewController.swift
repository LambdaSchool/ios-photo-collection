//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Jesse Ruiz on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    let photoController = PhotoController()
    let themeHelper = ThemeHelper(themePreferenceKey: "Dark") // TODO: Come back and edit
    
    // MARK: - Methods
    func setTheme() {
        let currentTheme = themeHelper.themePreference
        if currentTheme == "Dark" {
            view.backgroundColor = UIColor.darkGray
        } else {
            view.backgroundColor = UIColor.magenta
        }
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photoController.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowImageInfoSegue" {
            guard let getInfo = segue.destination as? PhotoDetailViewController,
                let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
            let photo = photoController.photos[indexPath.item]
            getInfo.photo = photo
            getInfo.photoController = photoController
            getInfo.themeHelper = themeHelper
        } else if segue.identifier == "AddNewPhotoSegue" {
            guard let addPhoto = segue.destination as? PhotoDetailViewController else { return }
            addPhoto.themeHelper = themeHelper
            addPhoto.photoController = photoController
        } else if segue.identifier == "SelectThemeModalSegue" {
            guard let selectTheme = segue.destination as? ThemeSelectionViewController else { return }
            selectTheme.themeHelper = themeHelper
        }
    }
}
