//
//  PhotosCollectionViewController.swift
//  PhotoIOSPT5
//
//  Created by David Williams on 2/19/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {


    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
    }
    
    
    override func viewDidLoad() {
           super.viewDidLoad()

       }

       // MARK: - Navigation -
    
       // In a storyboard-based application, you will often want to do a little preparation before navigation
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreatePhotoSegue" {
            guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
            destinationVC.photoController = photoController
        }
        if segue.identifier == "ShowPhotoSegue" {
            if let showPhotoVC = segue.destination as? PhotoDetailViewController {
                if let indexPath = collectionView.indexPathsForSelectedItems {
                    
                    showPhotoVC.photoController = photoController
                }
            }
        }
    }
       
//    private func photoFor(indexPath: IndexPath)  -> Photo {
//        var photo = Photo?.self
//        photo = photoController.sortPhotos[indexPath.item]
//        return photo
//    }
    
       // MARK: UICollectionViewDataSource

       override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           
           return photoController.photos.count
       }

       override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
           // Configure the cell
       
           return cell
       }
       
    
       func setTheme() {
        guard let theme = themeHelper.themePreference else { return }
        switch theme {
        case "Dark":
            view.backgroundColor = .darkGray
        case "Green":
            view.backgroundColor = .systemGreen
        default:
            break
        }
    }
      

       // MARK: UICollectionViewDelegate

      

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
       */

}
