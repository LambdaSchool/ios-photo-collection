//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Dennis Rudolph on 10/17/19.
//  Copyright © 2019 LambdaSchool. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTheme()
 
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoDetailSegue" {
            if let indexPath = collectionView.indexPathsForSelectedItems?.first,
                let detailVC = segue.destination as? PhotoDetailViewController {
                detailVC.photo = photoController.photos[indexPath.row]
                detailVC.themeHelper = themeHelper
            }
            
        } else if segue.identifier == "AddPhotoSegue" {
            if let detailVC = segue.destination as? PhotoDetailViewController {
                detailVC.photoController = photoController
                detailVC.themeHelper = themeHelper
            }
                
        } else if segue.identifier == "SelectThemeSegue" {
            if let themeVC = segue.destination as? ThemeSelectionViewController {
                themeVC.themeHelper = themeHelper
            }
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        
        let photo = photoController.photos[indexPath.row]
        cell.photo = photo
        
        return cell
    }
    
    func setTheme() {
        guard let pref = themeHelper.themePreference else { return }
        
        if pref == "Blue" {
            themeHelper.setThemePreferenceToBlue()
            self.view.backgroundColor = .blue
        } else if pref == "Dark" {
            themeHelper.setThemePreferenceToDark()
            self.view.backgroundColor = .lightGray
        }
    }
}
