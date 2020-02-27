//
//  PhotosCollectionViewController.swift
//  Photo-Collection (AP)
//
//  Created by Samuel Esserman on 2/27/20.
//  Copyright © 2020 Samuel Esserman. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
//MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
    }

// MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
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

   // MARK: - Navigation
       
       // In a storyboard-based application, you will often want to do a little preparation before navigation
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "SelectThemeModalSegue" {
              if let destVC = segue.destination as? ThemeSelectionViewController {
                  destVC.themeHelper = themeHelper
              }
              
          } else if segue.identifier == "AddPhotoShowSegue" {
              if let destVC = segue.destination as? PhotoDetailViewController {
                  destVC.photoController = photoController
                  destVC.themeHelper = themeHelper
              }
              
          } else if segue.identifier == "EditPhotoShowSegue" {
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
