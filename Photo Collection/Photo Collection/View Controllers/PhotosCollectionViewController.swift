//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Dillon P on 8/15/19.
//  Copyright © 2019 Dillon P. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
    }

    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhotoDetailSegue" {
            guard let addPhotoDetailVC = segue.destination as? PhotoDetailViewController else { return }
            addPhotoDetailVC.themeHelper = themeHelper
            addPhotoDetailVC.photoController = photoController
        } else if segue.identifier == "ShowPhotoDetailSegue" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController else { return }
            if let indexPath = collectionView.indexPathsForSelectedItems?.first {
                photoDetailVC.themeHelper = themeHelper
                photoDetailVC.photoController = photoController
                photoDetailVC.photo = photoController.photos[indexPath.row]
            }
        } else if segue.identifier == "SelectThemeModalSegue" {
            guard let selectThemeVC = segue.destination as? ThemeSelectionViewController else { return }
            selectThemeVC.themeHelper = themeHelper
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as?
            PhotoCollectionViewCell else { return UICollectionViewCell() }
        
        let photo = photoController.photos[indexPath.item]
        cell.titleLabel.text = photo.title
        cell.imageView.image = UIImage(data: photo.imageData)
    
        return cell
    }


    private func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        
        if themePreference == "Dark" {
            collectionView.backgroundColor = .lightGray
        } else if themePreference == "Red" {
            collectionView.backgroundColor = .red
        }
    }

}
