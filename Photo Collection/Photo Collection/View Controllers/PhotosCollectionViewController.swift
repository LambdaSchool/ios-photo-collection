//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Bronson Mullens on 4/30/20.
//  Copyright © 2020 Bronson Mullens. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

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
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        switch themePreference {
        case "Dark":
            collectionView.backgroundColor = .gray
        case "Blue":
            collectionView.backgroundColor = .blue
        default:
            break
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "AddPhotoSegue":
            if let addPhotoVC = segue.destination as? PhotoDetailViewController {
                addPhotoVC.themeHelper = themeHelper
                addPhotoVC.photoController = photoController
            }
        case "ChooseThemeSegue":
            if let themeVC = segue.destination as? ThemeSelectionViewController {
                themeVC.themeHelper = themeHelper
            }
        case "PhotoCellSegue":
            // Sets index path as first cell in visible collection
            guard let indexPath = collectionView.indexPathsForVisibleItems.first else { return }
            if let detailVC = segue.destination as? PhotoDetailViewController {
                detailVC.themeHelper = themeHelper
                detailVC.photoController = photoController
                detailVC.photo = photoController.photos[indexPath.item]
            }
        default:
            break
        }
        
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        
        let photo = photoController.photos[indexPath.item]
        cell.photoImageView.image = UIImage(data: photo.imageData)
        cell.photoLabel.text = photo.title
    
        return cell
    }

    // MARK: UICollectionViewDelegate

}
