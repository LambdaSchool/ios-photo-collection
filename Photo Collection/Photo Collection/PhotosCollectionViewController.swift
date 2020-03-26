//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Chris Dobek on 3/26/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }

        let photo = photoController.photos[indexPath.item]

        cell.photo = photo
        
        return cell
    }
    
    func setTheme() {
        guard let preference = themeHelper.themePreference else { return }
        if preference == "Dark" {
            collectionView.backgroundColor = .darkGray
        } else {
            collectionView.backgroundColor = .white
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "SelectThemeModally" {
           if let destVC = segue.destination as? ThemeSelectionViewController {
               destVC.themeHelper = themeHelper
           }

       } else if segue.identifier == "AddPhotoShowSegue" {
           if let destVC = segue.destination as? PhotoDetailViewController {
               destVC.photoController = photoController
               destVC.themeHelper = themeHelper
           }

       } else if segue.identifier == "" {
           if let destVC = segue.destination as? PhotoDetailViewController {
               destVC.photoController = photoController
               destVC.themeHelper = themeHelper
               let selectedIndex = collectionView.indexPathsForSelectedItems?.first
               if let index = selectedIndex {
                   destVC.photo = photoController.photos[index.item]
               }

           }

       }

    }
    
    
    
}
