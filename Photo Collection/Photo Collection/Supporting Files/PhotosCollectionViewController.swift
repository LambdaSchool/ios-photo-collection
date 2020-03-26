//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Joseph Rogers on 10/10/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    //MARK: Properties
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        switch segue.identifier {
        case "EditPhotoSegue":
            guard let editPhotoVC = segue.destination as? PhotoDetailViewController,
                let cell = sender as? PhotosCollectionViewCell,
                let indexPath = collectionView.indexPath(for: cell) else {fatalError()}
            editPhotoVC.themeHelper = themeHelper
            editPhotoVC.photoController = photoController
            editPhotoVC.photo = photoController.photos[indexPath.item]
        case "CreatePhotoSegue":
            guard let createPhotoVC = segue.destination as? PhotoDetailViewController else {return}
            createPhotoVC.themeHelper = themeHelper
            createPhotoVC.photoController = photoController
        case "SelectThemeSegue":
            guard let selectThemeVC = segue.destination as? ThemeSelectionViewController else {return}
            selectThemeVC.themeHelper = themeHelper
        case .none:
            fatalError("There was no segue ID \(String(describing: segue.identifier)) <ERROR>")
        case .some(_):
            fatalError("There Was an unknown segue <NOT UNWRAPPED> called during the prepare(for segue:) function")
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else {return UICollectionViewCell()}
    
        let photo = photoController.photos[indexPath.item]
        // Configure the cell
        cell.photoNameLabel.text = photo.title
        cell.photoCellImageView.image = UIImage(data: photo.imageData)
        return cell
    }
    
    func setTheme() {
        guard let themeHelper = themeHelper.themePreference else {return}
        
        if themeHelper == "Dark" {
            collectionView.backgroundView?.backgroundColor = UIColor.darkGray
        }else {
            collectionView.backgroundView?.backgroundColor = UIColor.blue
        }
    }
    
    
}
