//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Donella Barcelo on 11/14/19.
//  Copyright © 2019 Donella Barcelo. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        setTheme()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case String.addSegue:
            guard let detailVC = segue.destination as? PhotoDetailViewController else { return }
            detailVC.themeHelper = themeHelper
            detailVC.photoController = photoController
        case String.themeSegue:
            guard let themeVC = segue.destination as? ThemeSelectionViewController else { return }
            themeVC.modalPresentationStyle = .fullScreen
            themeVC.themeHelper = themeHelper
        default:
            return
        }
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .cellID, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        
        return cell
    }
    
    private func setTheme() {
        guard let themePreference = themeHelper.themePreferenceKey else { return }
        switch themePreference {
        case ThemeHelper.PropertyKeys.dark:
            collectionView.backgroundColor = .darkGray
        case ThemeHelper.PropertyKeys.white:
            collectionView.backgroundColor = .white
        default:
            collectionView.backgroundColor = .blue
        }
    }
}
