//
//  PhotosCollectionViewController.swift
//  ios-photo-collection
//
//  Created by user162867 on 12/19/19.
//  Copyright © 2019 user162867. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var photoController = PhotoController()
    var themeHelper = ThemeHelper()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else {
            return UICollectionViewCell()
        }
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        return cell
    }
    
    private func setTheme() {
        
        let themePreference = themeHelper.themePreferenceKey
        
        switch themePreference {
        case ThemeHelper.keys.dark:
            collectionView.backgroundColor = .darkGray
        case ThemeHelper.keys.blue:
            collectionView.backgroundColor = .blue
        default:
            collectionView.backgroundColor = .white
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "addPhotoSegue":
            guard let detailVC = segue.destination as? PhotoDetailViewController else { return }
            detailVC.themeHelper = themeHelper
            detailVC.photoController = photoController
        case "selectThemeSegue":
            guard let themeVC = segue.destination as? ThemeSelectionViewController else { return }
            themeVC.modalPresentationStyle = .fullScreen
            themeVC.themeHelper = themeHelper
        case "addPhotoFromCellSegue":
            if let detailVC = segue.destination as? PhotoDetailViewController,
                let indexPath = collectionView.indexPathsForSelectedItems?.first {
                detailVC.themeHelper = themeHelper
                detailVC.photoController = photoController
                detailVC.photo = photoController.photos[indexPath.row]
            }
        default:
            return
        }
    }

}
