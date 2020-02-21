//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Claudia Contreras on 2/20/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    //MARK: - Properties
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Functions
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        print("Theme Preference: \(themePreference)")
        //Change the collection view's background color
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addPhotoSegue" {
            let addPhotoVC = segue.destination as! PhotoDetailViewController
            addPhotoVC.themeHelper = themeHelper
            addPhotoVC.photoController = photoController
            
        } else if segue.identifier == "editPhotoSegue" {
            if let indexPath = collectionView.indexPathsForSelectedItems?.first?.item,
                let editPhotoVC = segue.destination as? PhotoDetailViewController {
                editPhotoVC.themeHelper = themeHelper
                editPhotoVC.photoController = photoController
                editPhotoVC.photo = photoController.photos[indexPath]
            }
            
        } else if segue.identifier == "selectThemeSegue" {
            let selectThemeVC = segue.destination as! ThemeSelectionViewController
            selectThemeVC.themeHelper = themeHelper
        }
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "AddPOIModalSegue" {
//            let addPOIVC = segue.destination as! AddPOIViewController
//            addPOIVC.delegate = self
//        } else if segue.identifier == "ShowPOIDetailSegue" {
//            if let indexPath = tableView.indexPathForSelectedRow,
//            let poiDetailVC = segue.destination as? POIDetailViewController {
//                poiDetailVC.poi = pois[indexPath.row]
//            }
//        }
//    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
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
