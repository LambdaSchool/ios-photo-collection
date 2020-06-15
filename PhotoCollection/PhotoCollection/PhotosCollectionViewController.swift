//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Dojo on 6/13/20.
//  Copyright © 2020 Dojo. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

protocol ThemeSelectionDelegate {
    func didSetTheme()
}

class PhotosCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        photoController.loadFromPersistentStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    func setTheme() {
        guard let theme = themeHelper.themePreference else { return }
        switch theme {
        case .dark:
            collectionView.backgroundColor = .darkGray
        case .light:
            collectionView.backgroundColor = .white
        default:
            collectionView.backgroundColor = .white
        }
    }
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPhoto" {
            let showPhotoVC = segue.destination as! PhotoDetailViewController
            showPhotoVC.themeHelper = themeHelper
            showPhotoVC.photoContoller = photoController
            guard let index = collectionView.indexPath(for: sender as! UICollectionViewCell)?.item else { return }
            showPhotoVC.photo = photoController.photos[index]
        } else if segue.identifier == "AddPhoto" {
            let addPhotoVC = segue.destination as! PhotoDetailViewController
            addPhotoVC.themeHelper = themeHelper
            addPhotoVC.photoContoller = photoController
        } else if segue.identifier == "SelectTheme" {
            let selectThemeVC = segue.destination as! ThemeSelectionViewController
            selectThemeVC.themeHelper = themeHelper
            selectThemeVC.delegate = self
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        return cell
    }
}

extension PhotosCollectionViewController: ThemeSelectionDelegate {
    func didSetTheme() {
        setTheme()
    }
    
    
}
