//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Elizabeth Thomas on 2/20/20.
//  Copyright © 2020 Libby Thomas. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    
    
    // MARK: - Life Cycle Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setTheme()
        
    }
    
    override func viewDidLoad() {
        setTheme()
    }
    

    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell()}
    
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        return cell
    }
    
    func setTheme() {
        guard let preference = themeHelper.themePreference  else { return }
        print("\(preference)")
    
        if preference == "Dark" {
            collectionView.backgroundColor = .darkGray
        } else if preference == "Green" {
            collectionView.backgroundColor = .green
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhotoSegue" {
            let addPhotoVC = segue.destination as? PhotoDetailViewController
            addPhotoVC?.photoController = photoController
            addPhotoVC?.themeHelper = themeHelper
        } else if segue.identifier == "PhotoDetailSegue" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController, let indexPath = collectionView?.indexPathsForSelectedItems?.first else {return}
            photoDetailVC.photo = photoController.photos[indexPath.item]
            photoDetailVC.themeHelper = themeHelper
        } else if segue.identifier == "ThemeSelectionSegue" {
            let themeSelectionVC = segue.destination as? ThemeSelectionViewController
            themeSelectionVC?.themeHelper = themeHelper
        }
    }


}
