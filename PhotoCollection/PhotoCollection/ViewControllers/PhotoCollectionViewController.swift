//
//  PhotoCollectionViewController.swift
//  PhotoCollection
//
//  Created by Cora Jacobson on 6/10/20.
//  Copyright © 2020 Cora Jacobson. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        setTheme()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "photoDetailShowSegue" {
            if let photoDetailVC = segue.destination as? PhotoDetailViewController {
                photoDetailVC.themeHelper = themeHelper
                photoDetailVC.photoController = photoController
                if let index = collectionView.indexPathsForSelectedItems?.first {
                    photoDetailVC.photo = photoController.photos[index.item]
                    photoDetailVC.navigationItem.title = photoController.photos[index.item].title
                }
            }
        } else if segue.identifier == "addPhotoShowSegue" {
            if let addPhotoVC = segue.destination as? PhotoDetailViewController {
                addPhotoVC.themeHelper = themeHelper
                addPhotoVC.photoController = photoController
                addPhotoVC.navigationItem.title = "Add Photo"
            }
        } else if segue.identifier == "themeSelectionModalSegue" {
            if let themeSelectionVC = segue.destination as? ThemeSelectionViewController {
                themeSelectionVC.themeHelper = themeHelper
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        cell.photo = photoController.photos[indexPath.item]
        return cell
    }
    
    func setTheme() {
        if let theme = themeHelper.themePreference {
            switch theme {
            case "Dark":
                collectionView.backgroundColor = .myDark
            default:
                collectionView.backgroundColor = .myPurple
            }
        } else { return }
    }

}
