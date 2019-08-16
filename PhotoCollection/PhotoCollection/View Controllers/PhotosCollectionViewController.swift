//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Vici Shaweddy on 8/15/19.
//  Copyright © 2019 Vici Shaweddy. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
        setTheme()
    }
    
    private func setTheme() {
        guard let themeColor = themeHelper.themePreference else { return }
        
        if themeColor == "Dark" {
            collectionView.backgroundColor = .black
        } else if themeColor == "Pink" {
            collectionView.backgroundColor = .purple
        }
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectTheme" {
            if let themeSelectionVC = segue.destination as? ThemeSelectionViewController {
                themeSelectionVC.themeHelper = self.themeHelper
            }
        } else if segue.identifier == "CreatePhoto" {
            if let photoDetailVC = segue.destination as? PhotoDetailViewController {
                photoDetailVC.themeHelper = self.themeHelper
                photoDetailVC.photoController = self.photoController
            }
        } else if segue.identifier == "ShowDetail" {
            if let photoDetailVC = segue.destination as? PhotoDetailViewController {
                
                guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
                photoDetailVC.themeHelper = self.themeHelper
                photoDetailVC.photoController = self.photoController
                photoDetailVC.photo = self.photoController.photos[indexPath.item]
            }
        }
    }

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        
        let photo = photoController.photos[indexPath.item]
        
//        let image = UIImage(data: imageData)
        
//        cell.imageView.image = image
        cell.photo = photo
    
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
