//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Enrique Gongora on 1/30/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    //MARK: - View Functions
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        setTheme()
        self.title = "Photo Collection"
    }
    
    //MARK: - UICollectionView Functions
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            case "AddPhotoSegue":
                if let addPhotoVC = segue.destination as? PhotoDetailViewController{
                    addPhotoVC.themeHelper = themeHelper
                    addPhotoVC.photoController = photoController
                }
            case "PhotoDetailSegue":
                guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
                if let photoDetailVC = segue.destination as? PhotoDetailViewController {
                    photoDetailVC.themeHelper = themeHelper
                    photoDetailVC.photoController = photoController
                    photoDetailVC.photo = photoController.photos[indexPath.item]
                }
            case "SelectThemeSegue":
                if let selectThemeVC = segue.destination as? ThemeSelectionViewController {
                    selectThemeVC.themeHelper = themeHelper
                }
            default:
                break
        }
    }
    
    //MARK: - Functions
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        switch themePreference {
        case "Dark":
            collectionView.backgroundColor = .lightGray
        case "Blue":
            collectionView.backgroundColor = .cyan
        default:
            break
        }
    }
}
