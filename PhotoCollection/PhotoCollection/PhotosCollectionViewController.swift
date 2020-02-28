//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Bradley Diroff on 2/27/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper(themePreferenceKey: "color")

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setTheme()
        collectionView.reloadData()
        
    }
    
    func setTheme() {
        guard let theme = themeHelper.themePreference else {return}
        print("THIS IS THE THEME: \(theme)")
        if theme == "Dark" {
            view.backgroundColor = UIColor.darkGray
            collectionView.backgroundColor = UIColor.darkGray
            print("THEME DARK")
        }
        
        if theme == "Blue" {
            view.backgroundColor = UIColor.systemBlue
            collectionView.backgroundColor = UIColor.systemBlue
            print("THEME BLUE")
        }
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "themeSegue" {
            guard let vc = segue.destination as? ThemeSelectionViewController else {return}
            vc.themeHelper = themeHelper
        }
        
        if segue.identifier == "addSegue" {
            guard let vc = segue.destination as? PhotoDetailViewController else {return}
            vc.themeHelper = themeHelper
            vc.photoController = photoController
            vc.delegate = self
        }
        
        if segue.identifier == "modifySegue" {
            guard let vc = segue.destination as? PhotoDetailViewController else {return}
            guard let cell = sender as? PhotosCollectionViewCell else {return}
            vc.themeHelper = themeHelper
            vc.photoController = photoController
            vc.photo = cell.photo
            vc.delegate = self
        }
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        print("THIS MANY PHOTOS: \(photoController.photos.count)")
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else {return UICollectionViewCell()}
        
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
    
        // Configure the cell
    
        return cell
    }

}

extension PhotosCollectionViewController: AddPhotoDelegate {
    func photoWasAdded(_ photo: Photo) {
        photoController.create(photo)
        collectionView.reloadData()
        print("It ran the protocol")
    }
    
    func photoWasUpdated(oldPhoto: Photo, title: String, imageData: Data) {
        photoController.update(photo: oldPhoto, aData: imageData, aString: title)
        collectionView.reloadData()
        print("It ran the protocol")
    }
    
    
}
