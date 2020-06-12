//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Gladymir Philippe on 6/11/20.
//  Copyright © 2020 Gladymir Philippe. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    let photoController = PhotoController()
    let themeHelper = ThemeHelper(themePreferenceKey: "Dark")
    
    func setTheme() {
           guard let currentTheme = themeHelper.themePreference else { return }
           if currentTheme == "Dark" {
               collectionView.backgroundColor = UIColor.darkGray
           } else {
               collectionView.backgroundColor = UIColor.green
           }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowCollectionViewSegue" {
                guard let getInfo = segue.destination as? PhotoDetailViewController,
                    let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
                let photo = photoController.photos[indexPath.item]
                getInfo.photo = photo
                getInfo.photoController = photoController
                getInfo.themeHelper = themeHelper
            } else if segue.identifier == "ShowAddSegue" {
                guard let addPhoto = segue.destination as? PhotoDetailViewController else { return }
                addPhoto.themeHelper = themeHelper
                addPhoto.photoController = photoController
            } else if segue.identifier == "SelectThemeSegue" {
                guard let selectTheme = segue.destination as? ThemeSelectionViewController else { return }
                selectTheme.themeHelper = themeHelper
        
        }
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell()}
    
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        
    
        return cell
    }

  

}
