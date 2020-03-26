//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Harmony Radley on 3/26/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
    
        let photo = photoController.photos[indexPath.row]
            
        cell.photo = photo
            
        return cell
    }

    func setTheme() {
          
          guard let themePreference = themeHelper.themePreference else { return }
          
          var backgroundColor: UIColor!
          
          switch themePreference {
          case "Dark":
              backgroundColor = .lightGray
          case "Blue":
            backgroundColor = .purple
          default:
              break
          }
          
          collectionView?.backgroundColor = backgroundColor
      }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          
          switch segue.identifier {
              
          case "SelectTheme":
              
              guard let destinationVC = segue.destination as? ThemeSelectionViewController else { return }
              
              destinationVC.themeHelper = themeHelper
              
          case "CreatePhoto":
              
              guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
              
              destinationVC.photoController = photoController
              destinationVC.themeHelper = themeHelper
              
          case "ViewPhoto":
              
              guard let destinationVC = segue.destination as? PhotoDetailViewController,
                  let indexPath = collectionView?.indexPathsForSelectedItems?.first else { return }
              
              destinationVC.photo = photoController.photos[indexPath.row]
              destinationVC.photoController = photoController
              destinationVC.themeHelper = themeHelper
              
          default:
              break
          }
      }
      

}
