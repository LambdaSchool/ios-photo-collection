//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Jocelyn Stuart on 1/16/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cellDetail" {
            guard let cellDetailController = segue.destination as? PhotoDetailViewController, let cell = sender as? PhotosCollectionViewCell else { return }
            
            cellDetailController.photoController = photoController
            cellDetailController.themeHelper = themeHelper
            cellDetailController.photo = cell.photo
            
        } else if segue.identifier == "addPhoto" {
            guard let addPhotoController = segue.destination as? PhotoDetailViewController else { return }
            
            // let indexPath = tableView.indexPathForSelectedRow
            
            addPhotoController.themeHelper = themeHelper
            addPhotoController.photoController = photoController
            
        }else if segue.identifier == "selectTheme" {
            guard let selectThemeController = segue.destination as? ThemeSelectionViewController else { return }
            
            selectThemeController.themeHelper = themeHelper
            
        }
    }
    

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! PhotosCollectionViewCell
    
        // Configure the cell
        let photo = photoController.photos[indexPath.item]
       // cell.imageView.image = photo.imageData
        cell.photo = photo
        
    
        return cell
    }
    
    func setTheme() {
        guard let theme = themeHelper.themePreference else { return }
        
        if theme == "Blue" {
            collectionView.backgroundColor = .blue
        } else if theme == "Dark" {
            collectionView.backgroundColor = .gray
        }
        
    }
    

}
