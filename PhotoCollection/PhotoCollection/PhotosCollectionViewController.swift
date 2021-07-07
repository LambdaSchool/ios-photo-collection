//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Ryan Murphy on 5/9/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"
let photoController = PhotoController()
let themeHelper = ThemeHelper()
class PhotosCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setTheme()
        collectionView.reloadData()
    }
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else {return}
        switch themePreference {
        case "Dark":
            collectionView.backgroundColor = .gray
        case "Blue":
            collectionView.backgroundColor = .blue
        default:
            return
        }
    }
    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditPhoto" {
            
            guard let destinationVC = segue.destination as? PhotoDetailViewController,
                let indexPath = collectionView.indexPathsForSelectedItems!.first
                else { return }
            
            destinationVC.themeHelper = themeHelper
            destinationVC.photoController = photoController
            destinationVC.photo = photoController.photos[indexPath.item]
        } else if segue.identifier == "AddPhoto" {
            
            guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
            
            destinationVC.themeHelper = themeHelper
            destinationVC.photoController = photoController
        } else if segue.identifier == "SelectTheme" {
            
            guard let destinationVC = segue.destination as? ThemeSelectionViewController else { return }
            destinationVC.themeHelper = themeHelper
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
