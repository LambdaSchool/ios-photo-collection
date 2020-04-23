//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Kelson Hartle on 4/23/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    
    //MARK: - Properties

    let photoController = PhotoController()

    let themeHelper = ThemeHelper()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
    }
    
    //MARK: - Functions
    
    func setTheme() {
        guard let currentTheme = themeHelper.themePreference else { return }
        
        switch currentTheme {
        case "Blue":
            view.backgroundColor = UIColor.blue
        default:
            view.backgroundColor = UIColor.darkGray
        }
        
        
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { fatalError("Incorrect reuse identifier.")}
        
        let photo = photoController.photos[indexPath.item]
    
        cell.photo = photo
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addPhotoSegue" {
            let photoDetailVC = segue.destination as? PhotoDetailViewController
        
            
            photoDetailVC?.photoController = photoController
            photoDetailVC?.themeHelper = themeHelper
            
            
        } else if segue.identifier == "cellToEditPhoto" {
            let photoDetailVC = segue.destination as? PhotoDetailViewController
            
            photoDetailVC?.photoController = photoController
            photoDetailVC?.themeHelper = themeHelper
            photoDetailVC?.photo = 
            
            //use index path
            
            
            
        } else if segue.identifier == "selectThemeSegue" {
            let themeSelectionVC = segue.destination as? ThemeSelectionViewController
            
        }
    }

}
