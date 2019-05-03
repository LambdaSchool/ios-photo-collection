//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Alex Perse on 5/2/19.
//  Copyright © 2019 Alex Perse. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    // MARK: - PhotosCollectionViewController
    func setTheme() {
        // Get curent theme
        guard let currentThemeHelper = self.themeHelper.themePreference else { return }
        
        self.collectionView.backgroundColor = (currentThemeHelper == String.dark) ? UIColor.darkGray: UIColor.blue
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photoController.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotosCollectionViewCell
        
        // The didset method handles the UI updates.
        cell.photo = self.photoController.photos[indexPath.item]
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectTheme"
        {
            guard let themeSelectionVC = segue.destination as? ThemeSelectionViewController else { return }
            
            themeSelectionVC.themeHelper = themeHelper
        }
        else if segue.identifier == "AddPhoto"
        {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController else { return }
            
            photoDetailVC.photoController = self.photoController
            photoDetailVC.themeHelper = self.themeHelper
            
        }
        else if segue.identifier == "ShowPhoto"
        {
            guard let indexPaths = self.collectionView.indexPathsForSelectedItems,
                let photoDetailVC = segue.destination as? PhotoDetailViewController else { return }
            
            // Selected item
            let indexPath = indexPaths[0]
            
            // Values to be passed
            photoDetailVC.photo = self.photoController.photos[indexPath.item]
            photoDetailVC.photoController = self.photoController
            photoDetailVC.themeHelper = self.themeHelper
        }
    }
    

}

