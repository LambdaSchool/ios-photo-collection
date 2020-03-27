//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Chris Dobek on 3/26/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import UIKit

private let resueIdentifer = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setTheme()
        collectionView.reloadData()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoController.photos.count
        }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }

        let photo = photoController.photos[indexPath.item]

        cell.photo = photo
        
        return cell
    }
    
    func setTheme() {
        guard let preference = themeHelper.themePreference else { return }
        if preference == "Dark" {
            collectionView.backgroundColor = .darkGray
        } else {
            collectionView.backgroundColor = .blue
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "SelectThemeModally" {
           if let destVC = segue.destination as? ThemeSelectionViewController {
               destVC.themeHelper = themeHelper
           }

       } else if segue.identifier == "AddPhotoShowSegue" {
           if let destVC = segue.destination as? PhotoDetailViewController {
               destVC.photoController = photoController
               destVC.themeHelper = themeHelper
           }

       } else if segue.identifier == "EditSegue" {
           guard let photoDetailViewController = segue.destination as? PhotoDetailViewController,
           let indexPath = collectionView.indexPathsForSelectedItems?.first else { fatalError("EditSegue failure to downcast") }
            photoDetailViewController.themeHelper = self.themeHelper
            photoDetailViewController.photoController = self.photoController
            photoDetailViewController.photo = photoController.photos[indexPath.row]
               }

           }

}
