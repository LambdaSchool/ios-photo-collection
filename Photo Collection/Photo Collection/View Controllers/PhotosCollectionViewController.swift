//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Jeremy Taylor on 5/9/19.
//  Copyright © 2019 Bytes-Random L.L.C. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhoto" {
            guard let destVC = segue.destination as? PhotoDetailViewController else { return }
            destVC.photoController = photoController
            destVC.themeHelper = themeHelper
            destVC.title = "Add Photo"
        } else if segue.identifier == "ShowDetail" {
            guard let destVC = segue.destination as? PhotoDetailViewController,
                let cell = sender as? PhotosCollectionViewCell else { return }
            
            destVC.photoController = photoController
            destVC.themeHelper = themeHelper
            destVC.photo = cell.photo
        } else if segue.identifier == "SelectTheme" {
            guard let destVC = segue.destination as? ThemeSelectionViewController else { return }
            destVC.themeHelper = themeHelper
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { fatalError("Can't dequeue custom cell")}
    
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
    
        return cell
    }

    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        
        if themePreference == "Dark" {
            collectionView?.backgroundColor = UIColor.lightGray
        } else {
            collectionView?.backgroundColor = UIColor.green
        }
        
    }
}
