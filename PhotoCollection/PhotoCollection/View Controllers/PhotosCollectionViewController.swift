//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Bohdan Tkachenko on 4/30/20.
//  Copyright © 2020 Bohdan Tkachenko. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    let photo: Photo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        
    }
    
    
    func setTheme() {
        guard let theme = themeHelper.themePreference else { return }
        if theme.description == "Red" {
            collectionView.backgroundColor = UIColor.red
        } else if theme.description == "Black" {
            collectionView.backgroundColor = UIColor.black
        }
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FromCellToPhotoDetail" {
            guard let photoControllerVC = segue.destination as? PhotoDetailViewController else {return}
            photoControllerVC.themeHelper = themeHelper
            photoControllerVC.photoController = photoController
            photoControllerVC.photo = photo
        } else if segue.identifier == "ToPhotodetailVC" {
            guard let photoVC = segue.destination as? PhotoDetailViewController else { return }
            photoVC.themeHelper = themeHelper
            photoVC.photoController = photoController
        } else if segue.identifier == "ToThemeVC" {
            guard let themeVC = segue.destination as? ThemeSelectionViewController else { return }
            themeVC.themeHelper = themeHelper
        }
        //            photoControllerVC.delegate = self
        //            themeVC.delegate = self
        
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    
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
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
extension PhotosCollectionViewController: PhotoDetailDelegate {
    
    func newPhoto(imageData: Data, title: String) {
        photoController.create(forImage: imageData, title: title)
        self.collectionView.reloadData()
    }
    
    
}
