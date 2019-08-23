//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Marc Jacques on 8/22/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        setTheme()

    }
    

    func setTheme() {
        guard let theme = themeHelper.themePreference else {
            collectionView.backgroundColor = .darkGray
            return
        }
        if theme == "Dark" {
            collectionView.backgroundColor = .darkGray
        } else {
            collectionView.backgroundColor = .blue
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhotoDetailSegue" {
            guard let addPhotoDetailVC = segue.destination as? PhotoDetailViewController else { return }
            addPhotoDetailVC.photoController = photoController
            addPhotoDetailVC.themeHelper = themeHelper
        } else if segue.identifier == "ShowPhotoDetailSegue" {
            guard let showPhotoDetailVC = segue.destination as? PhotoDetailViewController else { return }
            showPhotoDetailVC.photoController = photoController
            showPhotoDetailVC.themeHelper = themeHelper
            
            if let indexPath = self.collectionView.indexPathsForSelectedItems?.first {
                let index = indexPath[0]
                showPhotoDetailVC.photo = photoController.photos[index]
                //showPhotoDetailVC. = photoController.photos[indexPath[0].item].title
            }
        }
            else if segue.identifier == "ThemesSegue" {
            guard let ThemeSelectionVC = segue.destination as? ThemeSelectionViewController else { return }
                ThemeSelectionVC.themeHelper = themeHelper
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
    
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        
        return cell
    }

}
