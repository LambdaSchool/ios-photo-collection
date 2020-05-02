//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Dawn Jones on 4/30/20.
//  Copyright © 2020 Dawn Jones. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setTheme()
        collectionView.reloadData()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addController = segue.destination as? PhotoDetailViewController {
            if segue.identifier == "UpdatePhotoSegue" {
                guard let indexPath = collectionView?.indexPathsForSelectedItems?.first?.item else { return }
                addController.photo = photoController.photos[indexPath]
            }
            addController.themeHelper = themeHelper
            addController.photoController = photoController
        } else if let themeController = segue.destination as? ThemeSelectionViewController {
            themeController.delegate = self
            themeController.themeHelper = themeHelper
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
    
        let photo = photoController.photos[indexPath.item]
        cell.cellImage.image = UIImage(data: photo.imageData)
        cell.cellLabel.text = photo.title
    
        return cell
    }
    
    func setTheme() {
        guard let theme = themeHelper.themePreference else { return }
        print(theme)
        if theme == "Dark" {
            collectionView.backgroundColor = .darkGray
        } else if theme == "Green" {
            collectionView.backgroundColor = .green
        }
    }

}

extension PhotosCollectionViewController: ThemeDelegate {
    func didChangeTheme() {
        print("Function called")
        setTheme()
        collectionView.reloadData()
    }
}
