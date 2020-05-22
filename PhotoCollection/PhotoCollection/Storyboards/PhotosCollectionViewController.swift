//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Richard Gibbs on 5/21/20.
//  Copyright © 2020 Rich Gibbs. All rights reserved.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        
        // Do any additional setup after loading the view.
    }
    
    func setTheme() {
        
        
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else {
            fatalError("Collection view cell identifier is wrong or the cell is not a PhotoCollectionViewCell")
        }
        
        // Configure the cell
        let photo = photoController.photos[indexPath.item]
        cell.imageView.image = UIImage(data: photo.imageData)
        cell.photoLabel.text = photo.title
        
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CollectionViewCellSegue" {
            guard let photoCollectionVC = segue.destination as? PhotosCollectionViewController else {
                return
            }
//            photoCollectionVC.delegate = self
        }
    }
}

// MARK: UICollectionViewDelegate


/*
 Delegate Pattern Checklist
 - Protocol. What does the employee need to do for the customer?
 - Order food
 - Update a collection view on another view controller
 - Save a model object
 - Who is the delegator (Customer)?
 - Who is the delegate (Employee)?
 - Adopt/conform to the protocol on the delegate
 - A place where both the delegate and the delegator exist. Set the delegator's `.delegate` property (generally) to `self`.
 - VC -> VC: prepareForSegue
 - Cell -> View: cellForRow or cellForItem
 - The delegator needs to tell the delegate to run its function(s) from the protocol at the appropriate time. When a button is tapped, switch is flipped, etc.
 */

