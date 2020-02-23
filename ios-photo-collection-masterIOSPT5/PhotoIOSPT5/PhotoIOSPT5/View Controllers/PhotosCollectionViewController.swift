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
        let theme = themeHelper.themePrefer
        print("In PhotosCollectionView")
        switch theme {
        case "Blue":
            print("Blue")
         view.backgroundColor = .blue
        case "Dark":
            view.backgroundColor = .darkGray
        case "Green":
            view.backgroundColor = .green
        case "Indigo":
         view.backgroundColor = .cyan
        case "Orange":
         view.backgroundColor = .orange
        case "Red":
         view.backgroundColor = .red
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
