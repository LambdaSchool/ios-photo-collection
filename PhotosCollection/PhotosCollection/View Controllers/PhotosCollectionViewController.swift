//
//  PhotosCollectionViewController.swift
//  PhotosCollection
//
//  Created by Mike Nichols on 5/22/20.
//  Copyright © 2020 Mike Nichols. All rights reserved.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper(themePreferenceKey: "Dark")

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else {
            return
        }
        
        if themePreference == "Dark" {
            view.backgroundColor = UIColor(named: "black")
        } else if themePreference == "Blue" {
            view.backgroundColor = UIColor(named: "blue")
        }
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "SelectThemeSegue":
            
            let destinationVC = segue.destination
            
        } else if segue.identifier == "PhotoDetailSegue" {
            let destinationVC = segue.destination
            destinationVC.
            }
        }}

    // MARK: UICollectionViewDataSource
/*
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else {
            fatalError("Collection view cell identifier is wrong or not of type PhotosCollectionViewCell")
        }
        
        let photo = photoController.photos[indexPath.item]
        cell.imageView.image = UIImage(data: photo.imageData)
        cell.title.text = photo.title
        let photoCell = cell as PhotosCollectionViewCell
    
        return photoCell
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
