//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Josh Kocsis on 4/30/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCollectionCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper(themePreferenceKey: "Dark")
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        
        return cell
    }

    func setTheme() {
        let theme = themeHelper.themePreference
        if theme == "Dark" {
            collectionView.backgroundColor = UIColor.darkGray
        } else if theme == "Red" {
            collectionView.backgroundColor = UIColor.red
        }
    }
    // MARK: UICollectionViewDelegate
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "AddPhotoSegue":
            guard let addPhoto = segue.destination as? PhotoDetailViewController else { return }
            addPhoto.themeHelper = themeHelper
            addPhoto.photoController = photoController
        case "CollectionViewSegue":
            guard let detailVC = segue.destination as? PhotoDetailViewController,
                let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
            let photo = photoController.photos[indexPath.item]
            detailVC.photo = photo
            detailVC.photoController = photoController
            detailVC.themeHelper = themeHelper
        case "SelectThemeSegue":
            guard let selectTheme = segue.destination as? ThemeSelectionViewController else { return }
            selectTheme.themeHelper = themeHelper
            selectTheme.delegate = self
        default:
            break
        }
    }
}

extension PhotosCollectionViewController: ThemeDelegate {
    func themeUpdated() {
        setTheme()
        collectionView.reloadData()
    }
    
    
}
