//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Hunter Oppel on 3/26/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
    }

    // MARK: - Functions
    
    func setTheme() {
        guard let theme = themeHelper.themePreference else {return}
        
        if theme == "Dark" {
            view.backgroundColor = .darkGray
        } else if theme == "Blue" {
            view.backgroundColor = .blue
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowUpdatePhoto",
            let photoVC = segue.destination as? PhotoViewController,
            let cell = sender as? PhotosCollectionViewCell,
            let indexPath = collectionView.indexPath(for: cell) {
            
            photoVC.themeHelper = themeHelper
            photoVC.photoController = photoController
            photoVC.photo = photoController.photos[indexPath.row]
        } else if segue.identifier == "ShowAddPhoto",
            let photoVC = segue.destination as? PhotoViewController {
            
            photoVC.themeHelper = themeHelper
            photoVC.photoController = photoController
        } else if segue.identifier == "ModalSelectTheme",
            let themeSelectionVC = segue.destination as? ThemeSelectionViewController {
            
            themeSelectionVC.themeHelper = themeHelper
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else {
            fatalError("Cell did not return as PhotoCollectionViewCell")
        }
        
        cell.photo = photoController.photos[indexPath.row]
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
