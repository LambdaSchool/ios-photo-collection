//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Nichole Davidson on 2/27/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    // MARK: - Navigation
   // FIXME: segue help
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhotoSegue" {
            if let addPhotoVC = segue.destination as? PhotoDetailViewController {
//                addPhotoVC.themeHelper
//                addPhotoVC.photoController
                
            } else if segue.identifier == "PhotoDetailSegue" {
                if let viewImageVC = segue.destination as? PhotoDetailViewController {
//                    viewImageVC.themeHelper
//                    viewImageVC.photoController
//                    viewImageVC.photo
                    
                } else if segue.identifier == "SelectThemeSegue" {
                    if let selectThemeVC = segue.destination as? ThemeSelectionViewController {
//                        selectThemeVC.themeHelper
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
