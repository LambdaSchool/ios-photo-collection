//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Jeffrey Carpenter on 5/2/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        
        if themePreference == "Dark" {
            collectionView.backgroundView?.backgroundColor = .gray
        } else {
            collectionView.backgroundView?.backgroundColor = .magenta
        }
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        if segue.identifier == "PhotoDetail" || segue.identifier == "AddPhoto" {
            guard let destinationVC = segue.destination as? PhotoDetailViewController,
            let indexPath = collectionView.indexPathsForSelectedItems!.first
            else { return }
            if segue.identifier == "PhotoDetail" {
                destinationVC.themeHelper = themeHelper
                destinationVC.photoController = photoController
                destinationVC.photo = photoController.photos[indexPath.item]
            } else {
                destinationVC.themeHelper = themeHelper
                destinationVC.photoController = photoController
            }
        } else {
            guard let themeVC = segue.destination as? ThemeSelectionViewController else { return }
            themeVC.themeHelper = themeHelper
        }
        
        
        
    }
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        guard let photoCell = cell as? PhotosCollectionViewCell else { return cell }
        
        photoCell.photo = photoController.photos[indexPath.item]
    
        return cell
    }



}
