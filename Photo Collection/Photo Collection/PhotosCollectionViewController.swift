//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Alex Thompson on 10/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CollectionCell" {
            guard let getInfo = segue.destination as? PhotoDetailViewController,
                let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
            let photo = photoController.photos[indexPath.item]
            getInfo.photo = photo
            getInfo.photoController = photoController
            getInfo.themeHelper = themeHelper
        } else if segue.identifier == "DetailViewControllerSegue" {
            guard let addPhoto = segue.destination as? PhotoDetailViewController else { return }
            addPhoto.themeHelper = themeHelper
            addPhoto.photoController = photoController
        } else if segue.identifier == "ThemeSelectorSegue" {
            guard let selectTheme = segue.destination as? ThemeSelectionViewController else { return }
            selectTheme.themeHelper = themeHelper
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
        guard let theme = themeHelper.themePreference else { return }
        switch theme {
        case "Dark":
            view.backgroundColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 30/100, alpha: 1.0)
        case "Red":
            view.backgroundColor = UIColor(hue: 8/360, saturation: 100/100, brightness: 99/100, alpha: 1.0)
        default:
            view.backgroundColor = .white
            
        }

    }

}
