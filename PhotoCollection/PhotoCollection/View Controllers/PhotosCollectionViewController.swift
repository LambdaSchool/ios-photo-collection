//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Elizabeth Thomas on 2/20/20.
//  Copyright © 2020 Libby Thomas. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    

    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell()}
    
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        return cell
    }
    
    func setTheme() {
        guard themeHelper.themePreference == nil else { return }
        if themeHelper.themePreference == "Dark" {
            themeHelper.setThemePreferenceToDark()
        } else if themeHelper.themePreference == "Green" {
            themeHelper.setThemePreferenceToGreen()
        }
    }


}
