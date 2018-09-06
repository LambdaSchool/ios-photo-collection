//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Dillon McElhinney on 9/6/18.
//  Copyright © 2018 Dillon McElhinney. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    // MARK: - Properties
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    // MARK: - Lifecycle Functions
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
        setTheme()
    }
    
    // MARK: - UI Collection View Data Source
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotosCollectionViewCell
        let photo = photoController.photos[indexPath.item]
        
        cell.themeHelper = themeHelper
        cell.photo = photo
    
        return cell
    }
    
    // MARK: - UI Collection View Delegate Flow Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //Get the photo for the cell
        let photo = photoController.photos[indexPath.item]
        //Calculate the size based on the aspect ratio of the image
        let size  = CGSize(width: 160, height: (160 * photo.aspect) + 30)
        
        return size
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhotoSegue" {
            // Adding a new photo, pass the photo controller and the theme helper
            guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
            
            destinationVC.photoController = photoController
            destinationVC.themeHelper = themeHelper
            
        } else if segue.identifier == "ShowPhotoSegue" {
            // Showing an existing photo, pass the photo, photo controller and the theme helper
            guard let destinationVC = segue.destination as? PhotoDetailViewController,
            let indexPaths = collectionView?.indexPathsForSelectedItems,
            let indexPath = indexPaths.first else { return }
            let photo = photoController.photos[indexPath.item]
            
            destinationVC.photo = photo
            destinationVC.photoController = photoController
            destinationVC.themeHelper = themeHelper
            
        } else if segue.identifier == "SelectThemeIdentifier" {
            // Going to theme selection, pass the theme helper
            guard let destincationVC = segue.destination as? ThemeSelectionViewController else { return }
            
            destincationVC.themeHelper = themeHelper
        }
    }
    
    // MARK: - Private Utility Methods
    func setTheme() {
        guard themeHelper.themePreference != nil else { return }
        
        collectionView?.backgroundColor = ThemeHelper.backgroundColor
        navigationController?.navigationBar.barStyle = ThemeHelper.navBarColor

    }
}
