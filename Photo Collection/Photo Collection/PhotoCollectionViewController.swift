//
//  PhotoCollectionViewController.swift
//  Photo Collection
//
//  Created by Isaac Lyons on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotoCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    func updateViews() {
        setTheme()
        collectionView.reloadData()
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photoDetailVC = segue.destination as? PhotoDetailViewController {
            photoDetailVC.themeHelper = themeHelper
            photoDetailVC.photoController = photoController
            if segue.identifier == "viewPhotoShowSegue",
                let indexPath = collectionView.indexPathsForSelectedItems {
                photoDetailVC.photo = photoController.photos[indexPath[0].item]
            }
        } else if let themeSelectionVC = segue.destination as? ThemeSelectionViewController {
            themeSelectionVC.themeHelper = themeHelper
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
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
        guard let theme = themeHelper.themePerference else { return }
        switch theme {
        case "Dark":
            collectionView.backgroundColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 30/100, alpha: 1.0)
        case "Orange":
            collectionView.backgroundColor = UIColor(hue: 29/360, saturation: 42/100, brightness: 100/100, alpha: 1.0)
        default:
            collectionView.backgroundColor = .white
        }
    }

}
