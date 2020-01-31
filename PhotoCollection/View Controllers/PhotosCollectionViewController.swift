//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Chris Gonzales on 1/30/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    func setTheme(){
        let preference = themeHelper
        
        guard let unwrappedPreference = preference.themePreference else {return}
        if unwrappedPreference == "Dark"{
            view.backgroundColor = .gray
        } else{
            view.backgroundColor = .green
        }
        
    }
    
    @IBAction func unwindToPhotoCollection(_ sender: UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
    }
    
 
     // MARK: - Navigation
    
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "AddPhotoSegue"{
            if let photoDetailVC = segue.destination as? PhotoDetailViewController{
                photoDetailVC.photoController = photoController
                photoDetailVC.themeHelper = themeHelper
            }
        }
        
        if segue.identifier == "EditPhotoSegue"{
            guard let indexPath = collectionView.indexPathsForSelectedItems?.first,
                let photoDetailVC = segue.destination as? PhotoDetailViewController else {return}
            photoDetailVC.photo = photoController.photos[indexPath.item]
            photoDetailVC.themeHelper = themeHelper
            photoDetailVC.photoController = photoController
        }
        
        
        
        
        
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoLibraryCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        let photos = photoController.photos[indexPath.item]
        cell.photo = photos
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoLibraryCell", for: indexPath) as? PhotosCollectionViewCell else {return}
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        return
//        let photo = photoController.photos[indexPath.item]
//        PhotosCollectionViewCell = photo as? PhotosCollectionViewCell else {return}
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
