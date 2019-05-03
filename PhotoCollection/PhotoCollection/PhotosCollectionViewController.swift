//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by morse on 5/2/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController /*, PhotoTableViewCellDelegate*/ {
    
    let photoController = PhotoController()
    var themeHelper = ThemeHelper()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "PhotosCollectionViewCell" {
            guard let photosCollectionVC = segue.destination as? PhotoDetailViewController else { return }
            guard let cell = sender as? PhotosCollectionViewCell else { return }
            
            photosCollectionVC.photoController = photoController
            photosCollectionVC.themeHelper = themeHelper
            photosCollectionVC.photo = cell.photo
        } else if segue.identifier == "AddButton" {
            guard let addPhotoVC = segue.destination as? PhotoDetailViewController else { return }
            
            addPhotoVC.photoController = photoController
            addPhotoVC.themeHelper = themeHelper
        } else if segue.identifier == "SelectTheme" {
            guard let themeVC = segue.destination as? ThemeSelectionViewController else { return }
            
            themeVC.themeHelper = themeHelper
        }
        
        
       
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
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
        let photocell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotosCollectionViewCell
        
        let photo = photoController.photos[indexPath.item]
        
        photocell.photo = photo
        
        let image = UIImage(data: photo.imageData)
        
        
        
        photocell.textLabel.text = photo.title
        photocell.imageView.image = image
    
        return photocell
    }
    
    
    // MARK: - Theme
    
    func setTheme() {
        guard let currentThemePreference = themeHelper.themePreference else { return }
        
        if currentThemePreference == "Dark" {
            collectionView.backgroundColor = .gray
        } else {
            collectionView.backgroundColor = .purple
        }
        
        
        // TODO: Dan look into this: collectionView.backgroundColor = UIColor(named: "White")
        
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
