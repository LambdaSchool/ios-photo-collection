//
//  PhotosCollectionViewController.swift
//  ios-photo-collection
//
//  Created by De MicheliStefano on 02.08.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell")

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Methods
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        themePreference == "Dark" ? themeHelper.setThemePreferenceToBlue() : themeHelper.setThemePreferenceToDark()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photoDetailVC = segue.destination as? PhotoDetailViewController,
            let themeSettingsVC = segue.destination as? ThemeSelectionViewController,
            let indexPath = collectionView?.indexPathsForSelectedItems?.first else { return }
        
        if segue.identifier == "ShowAddPhotoDetail" {
            photoDetailVC.photoController =  photoController
            photoDetailVC.themeHelper = themeHelper
        } else if segue.identifier == "ShowPhotoDetail" {
            photoDetailVC.photoController =  photoController
            photoDetailVC.photo = photoController.photos[indexPath.item]
            photoDetailVC.themeHelper = themeHelper
        } else if segue.identifier == "ShowThemeSettingsModal" {
            themeSettingsVC.themeHelper = themeHelper
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath)
    
        guard let photoCell = cell as? PhotoCollectionViewCell else { return cell }
        let photo = photoController.photos[indexPath.item]
        photoCell.photo = photo
    
        return cell
    }
    
    // MARK: - Properties
    
    var photoController = PhotoController()
    var themeHelper = ThemeHelper()
    
}
