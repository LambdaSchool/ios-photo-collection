//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Nichole Davidson on 2/27/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           collectionView.reloadData()
            
        setTheme()
       }
    
    // MARK: - Navigation
   // FIXME: segue help - I don't think how I'm 'passing' the info correctly.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhotoSegue" {
            if let addPhotoVC = segue.destination as? PhotoDetailViewController {
                addPhotoVC.themeHelper = themeHelper
                addPhotoVC.photoController = photoController
                
            } else if segue.identifier == "PhotoDetailSegue" {
                if let viewImageVC = segue.destination as? PhotoDetailViewController {
                    viewImageVC.themeHelper = themeHelper
                    viewImageVC.photoController = photoController
                    viewImageVC.photoController?.photos = photoController.photos
                    
                } else if segue.identifier == "SelectThemeSegue" {
                    if let selectThemeVC = segue.destination as? ThemeSelectionViewController {
                        selectThemeVC.themeHelper = themeHelper
                    }
                }
            }
        }
        
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionCell", for: indexPath) as? PhotosCollectionViewCell else { fatalError("Cell is not a PhotoCollectionViewCell ")}
        
        let photo = photoController.photos[indexPath.row]
    
        cell.photo = photo
    
        return cell
    }
    
    func setTheme() {
        if themeHelper.themePreference == "Sienna" {
            self.view.backgroundColor = UIColor(red: 235, green: 100, blue: 100, alpha: 1)
        } else {
            self.view.backgroundColor = UIColor.darkGray
        }
    }
}
