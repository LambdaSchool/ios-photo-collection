//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Norlan Tibanear on 6/11/20.
//  Copyright © 2020 Norlan Tibanear. All rights reserved.
//

import UIKit

//  private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    
    // Properties Var
    var photoController = PhotoController()
    var themeHelper = ThemHelper()

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setTheme()
//        collectionView.reloadData()
//    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        setTheme()
        collectionView.reloadData()
    }
    
    
//    func setTheme() {
//        guard let theme = themeHelper.themePreference else { return }
//
//        if theme == "Dark" {
//            self.collectionView.backgroundColor = UIColor.systemGray
//        } else if theme == "Light" {
//            self.collectionView.backgroundColor = UIColor.white
//        }
//    }
    
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
    
        let newcell = photoController.photos[indexPath.item]
        cell.photo = newcell
    
        return cell
    }

    // MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAddPhotoVC" {
            if let addVC = segue.destination as? PhotoDetailViewController {
                addVC.themeHelper = themeHelper
                addVC.photoController = photoController
                
            } else if segue.identifier == "reviewPhotoDetail" {
                guard let reviewDetailVC = segue.destination as? PhotoDetailViewController,
                    let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
                reviewDetailVC.themeHelper = themeHelper
                reviewDetailVC.photoController = photoController
                reviewDetailVC.photo = photoController.photos[indexPath.item]
                
            } else if segue.identifier == "gotoSelectTheme" {
                if let themeVC = segue.destination as? ThemeSelectionViewController {
                    themeVC.themeHelper = themeHelper
                   // themeVC.delegate = self
                }
            } 
        }
    }

} // END

//extension PhotosCollectionViewController: ThemeSelectionDelegate {
//    func themeWasUpdate() {
//        setTheme()
//        collectionView.reloadData()
//
//    }
//
//
//}
