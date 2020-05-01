//
//  PhotosCollectionViewController.swift
//  PhotoCollectionView
//
//  Created by Clayton Watkins on 4/29/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    //MARK: - Properties
    var photoController = PhotoController()
    var themeHelper = ThemeHelper()
    
    
    //MARK: - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
    }
    
    //MARK: - Helper Functions
    func setTheme(){
        guard let theme = themeHelper.themePreference else { return }
        if theme == "Dark"{
            self.collectionView.backgroundColor = .darkGray
        } else if theme == "Blue"{
            self.collectionView.backgroundColor = .cyan
        }
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else {return UICollectionViewCell()}
        let photo = photoController.photos[indexPath.item]
        cell.titleLabel.text = photo.title
        cell.imageView.image = UIImage(data: photo.imageData)
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhotoDetailSegue"{
            guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
            destinationVC.themeHelper = themeHelper
            destinationVC.photoController = photoController
        }
        else if segue.identifier == "ViewPhotoDetailSegue"{
            guard let destinationVC = segue.destination as? PhotoDetailViewController,
                let indexPath = collectionView.indexPathsForSelectedItems?.first
                else {return}
            destinationVC.themeHelper = themeHelper
            destinationVC.photoController = photoController
            destinationVC.photo = photoController.photos[indexPath.item]
        }
        else if segue.identifier == "ChangeThemeSegue"{
            guard let themeVC = segue.destination as? ThemeSelectionViewController else { return }
            themeVC.themeHelper = themeHelper
            themeVC.delegate = self
        }
    }
}

extension PhotosCollectionViewController: ThemeSelectionDelegate{
    func themeWasUpdated() {
        setTheme()
        collectionView.reloadData()
    }
}
