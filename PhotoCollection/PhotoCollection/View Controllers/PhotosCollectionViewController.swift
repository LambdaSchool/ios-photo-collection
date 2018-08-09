//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Lisa Sampson on 8/9/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView?.reloadData()
        
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
    
        let photo = photoController.photos[indexPath.item]
        cell.photoImageView?.image = UIImage(data: photo.imageData)
        cell.photoLabel.text = photo.title
    
        return cell
    }
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        
        if themePreference == "Purple" {
            collectionView?.backgroundColor = UIColor.purple
        } else {
            collectionView?.backgroundColor = UIColor.darkGray
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? PhotoDetailViewController {
            detailVC.photoController = photoController
            detailVC.themeHelper = themeHelper
            
            if segue.identifier == "UpdatePhotoSegue" {
                guard let index = collectionView?.indexPathsForSelectedItems?.first?.item else { return }
                let photo = photoController.photos[index]
                detailVC.photo = photo
            } else if segue.identifier == "AddPhotoSegue" {
            }
        }
        
        if let selectThemeVC = segue.destination as? ThemeSelectionViewController {
            selectThemeVC.themeHelper = themeHelper
        }
    }

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

}
