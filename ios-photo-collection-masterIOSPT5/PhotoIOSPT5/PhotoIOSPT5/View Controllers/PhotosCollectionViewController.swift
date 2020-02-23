//
//  PhotosCollectionViewController.swift
//  PhotoIOSPT5
//
//  Created by David Williams on 2/19/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    var photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
        setTheme()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func updateViews() {
      
    }
    // MARK: - Navigation -
    
       // In a storyboard-based application, you will often want to do a little preparation before navigation
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreatePhotoSegue" {
            guard let creationVC = segue.destination as? PhotoDetailViewController else { return }
            creationVC.photoController = photoController
            creationVC.themeHelper = themeHelper
        }
        if segue.identifier == "SelectThemeSegue" {
            guard let selectThemeVC = segue.destination as? ThemeSelectionViewController else { return }
            selectThemeVC.delegate = self
            selectThemeVC.themeHelper = themeHelper
        }
        if segue.identifier == "ShowPhotoSegue" {
            if let showPhotoVC = segue.destination as? PhotoDetailViewController {
                guard let indexPath = collectionView.indexPath(for: sender as! PhotosCollectionViewCell) else { return }
                     
                    showPhotoVC.photoController = photoController
                    showPhotoVC.themeHelper = themeHelper
                showPhotoVC.photo = photoController.sortPhotos[indexPath.item]
                
            }
        }
    }
       // MARK: UICollectionViewDataSource

       override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           
           return photoController.photos.count
       }

       override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        let photo = photoController.sortPhotos[indexPath.item]
       // let photo = photoController.photos[indexPath.item]
        cell.photo = photo
   
           return cell
       }
       
    func setTheme() {
        let theme = themeHelper.themePreference
        switch theme {
        case "Blue":
            collectionView.backgroundColor = .systemBlue
        case "Brown":
            collectionView.backgroundColor = .brown
        case "Dark":
            collectionView.backgroundColor = .darkGray
        case "Green":
            collectionView.backgroundColor = .systemGreen
        case "Indigo":
         collectionView.backgroundColor = .systemIndigo
        case "Orange":
         collectionView.backgroundColor = .systemOrange
        case "Purple":
            collectionView.backgroundColor = .systemPurple
        case "Red":
         collectionView.backgroundColor = .systemRed
        case "Teal":
            collectionView.backgroundColor = .systemTeal
        case "Yellow":
            collectionView.backgroundColor = .systemYellow
        default:
            break
        }
    }
}

extension PhotosCollectionViewController: ThemeSelectedDelegate {
    func themeChosen() {
        setTheme()
    }
}
