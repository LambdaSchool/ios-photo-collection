//
//  PhotosCollectionViewController.swift
//  Photo Collection AP
//
//  Created by Jorge Alvarez on 12/19/19.
//  Copyright © 2019 Jorge Alvarez. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    // NOT DONE
    func setTheme() {
        //1. Get the current themePreference from the themeHelper. Make sure it has a value, or return out of the function
        //2. Based on the value, change the collection views backgroundcolor depending on whether the theme is dark or the other color
    }
    
    // This gets called every time the view controller becomes the main VC
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ThemeModalSegue" {
            guard let themeVC = segue.destination as? ThemeSelectionViewController else {return}
            themeVC.themeHelper = self.themeHelper
        }
        
//        if segue.identifier == "ModalDestinationDatePickerSegue" {
//            guard let datePickerVC = segue.destination as? DatePickerViewController else {return}
//            // sets up the TimesCircuitViewController as the delegate or employee of the DatePickerViewController
//            datePickerVC.delegate = self
//        }
        
        if segue.identifier == "PhotoDetailSegue" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController else {return}
            photoDetailVC.themeHelper = self.themeHelper
            photoDetailVC.photoController = self.photoController
            // Pass in photo?
        }
        
        if segue.identifier == "AddPhotSegue" {
            guard let addPhotoDetailVC = segue.destination as? PhotoDetailViewController else {return}
            addPhotoDetailVC.themeHelper = self.themeHelper
            addPhotoDetailVC.photoController = self.photoController
            
        }
    }

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else {return UICollectionViewCell()}
    
        // Configure the cell
        let photo = photoController.photos[indexPath.item]
        
        cell.nameLabel.text = photo.title
        cell.imageView.image = UIImage(data: photo.imageData)
        
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
