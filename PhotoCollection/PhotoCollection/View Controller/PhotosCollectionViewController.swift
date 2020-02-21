//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Claudia Contreras on 2/20/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    //MARK: - Properties
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
           setTheme()
           collectionView.reloadData()
       }
    
    //MARK: - Functions
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        print("Theme Preference: \(themePreference)")
        //Change the collection view's background color
        if themeHelper.themePreference == "Dark" {
            collectionView.backgroundColor = .darkGray
        } else {
            collectionView.backgroundColor = .cyan
        }
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addPhotoSegue" {
            let addPhotoVC = segue.destination as! PhotoDetailViewController
            addPhotoVC.themeHelper = themeHelper
            addPhotoVC.photoController = photoController
            
        } else if segue.identifier == "editPhotoSegue" {
            if let indexPath = collectionView.indexPathsForSelectedItems?.first?.item,
                let editPhotoVC = segue.destination as? PhotoDetailViewController {
                editPhotoVC.themeHelper = themeHelper
                editPhotoVC.photoController = photoController
                editPhotoVC.photo = photoController.photos[indexPath]
            }
            
        } else if segue.identifier == "selectThemeSegue" {
            let selectThemeVC = segue.destination as! ThemeSelectionViewController
            selectThemeVC.themeHelper = themeHelper
        }
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        return cell
    }

}
