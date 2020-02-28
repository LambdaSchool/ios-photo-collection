//
//  PhotosCollectionViewController.swift
//  iOSPhotoCollection
//
//  Created by Bhawnish Kumar on 2/27/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import UIKit

protocol ThemeSelectionDelegate {
    func didSetTheme()
}

class PhotosCollectionViewController: UICollectionViewController {

    let photoController = PhotoController()
   
    let themeHelper = ThemeHelper()
    
    func setTheme() {
        
          guard let themePreference = themeHelper.themePreference else { return }
        
          var backgroundColor: UIColor!
          switch themePreference {
          case "Dark":
              backgroundColor = .lightGray
          case "Blue":
              backgroundColor = UIColor(red: 61/255, green: 172/255, blue: 247/255, alpha: 1)
          default:
              break
          }
          collectionView?.backgroundColor = backgroundColor
      }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            collectionView?.reloadData()
            setTheme()
        }

    
        // Do any additional setup after loading the view.
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoCellSegue" {
            
            guard let destinationVC = segue.destination as? PhotosDetailViewController else { return }
            
            destinationVC.photoController = photoController
            
        } else if segue.identifier == "AddButtonSegue" {
                guard let destinationVC = segue.destination as? PhotosDetailViewController else { return }
            destinationVC.photoController = photoController
            
        } else if segue.identifier == "selectThemeSegue" {
            guard let destinationVC = segue.destination as? ThemeSelectionViewController else { return }
            
        destinationVC.themeHelper = themeHelper
        }
        
                   
        
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }


  

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { fatalError("Cell is not a PhotoCollectionViewCell") }
        
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        
        
        
        return cell
    }

  

}
extension PhotosCollectionViewController: ThemeSelectionDelegate {
    func didSetTheme() {
        setTheme()
    }

}
