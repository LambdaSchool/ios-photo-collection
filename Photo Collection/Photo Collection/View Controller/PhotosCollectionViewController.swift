//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Alex Rhodes on 7/25/19.
//  Copyright © 2019 Blake Andrew Price. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView.reloadData()
        setTheme()
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        
        let selectedPhoto = photoController.photos[indexPath.item]
        cell.photo = selectedPhoto
    
        return cell
    }
    
    func setTheme() {
        guard let themeChosen = themeHelper.themePreference else {return}
        
        if themeChosen == "Dark" {
            collectionView.backgroundColor  = UIColor.darkGray
        } else {
            collectionView.backgroundColor = UIColor.white
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailFromAdd" {
            guard let addVC = segue.destination as? PhotoDetailViewController else {return}
            addVC.themeHelper = themeHelper
            addVC.photoController = photoController
        } else if segue.identifier == "ShowDetailFromCell" {
            guard let cellVC = segue.destination as? PhotoDetailViewController else {return}
            cellVC.photoController = photoController
            cellVC.themeHelper = themeHelper
            guard let index = collectionView.indexPathsForSelectedItems?.first else {return}
            cellVC.photo = photoController.photos[index.item]
        } else if segue.identifier == "SetThemeSegue" {
            guard let themeVC = segue.destination as? ThemeSelectionViewController else {return}
            themeVC.themeHelper = themeHelper
        }
        
    }
    
}
