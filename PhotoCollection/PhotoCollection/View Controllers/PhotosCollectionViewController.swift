//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Gi Pyo Kim on 9/19/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    // MARK: - Properties
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        setTheme()
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
    
        // Configure the cell
        cell.photo = photoController.photos[indexPath.item]
    
        return cell
    }

    // MARK: Methods
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        
        switch themePreference {
        case "Dark":
            collectionView.backgroundColor = UIColor.gray
        case "Random":
            collectionView.backgroundColor = UIColor(hue: CGFloat(themeHelper.hueValue), saturation: 70, brightness: 70, alpha: 1)
        default:
            print("Invalid themePreference")
            return
        }
    }
    
    // MARK: Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhotoSegue" {
            if let photoDetailVC = segue.destination as? PhotoDetailViewController {
                photoDetailVC.themeHelper = themeHelper
                photoDetailVC.photoController = photoController
            }
            
        } else if segue.identifier == "EditPhotoSegue" {
            if let photoDetailVC = segue.destination as? PhotoDetailViewController,
                let cell = sender as? UICollectionViewCell,
                let indexPath = collectionView!.indexPath(for: cell) {
                    photoDetailVC.themeHelper = themeHelper
                    photoDetailVC.photoController = photoController
                    photoDetailVC.photo = photoController.photos[indexPath.item]
            }
            
        } else if segue.identifier == "SelectThemeModalSegue" {
            if let themeSelectionVC = segue.destination as? ThemeSelectionViewController {
                themeSelectionVC.themeHelper = themeHelper
            }
            
        }
    }

}
