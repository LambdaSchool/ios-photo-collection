//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Farhan on 9/6/18.
//  Copyright © 2018 Farhan. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"
let photoController = PhotoController()
let themeHelper = ThemeHelper()



class PhotosCollectionViewController: UICollectionViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setTheme()
        collectionView?.reloadData()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell
    
        // Configure the cell
        let photo = photoController.photos[indexPath.item]
    
        cell.photo = photo
        
        return cell
    }
    
    func setTheme(){
        
        guard let pref = themeHelper.themePreference else {return}
        
        if pref == "Dark"{
            collectionView?.backgroundColor = UIColor.darkGray
        }
        else if pref == "Red"{
            collectionView?.backgroundColor = UIColor.red
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        
        
        if segue.identifier == "CellSegue" {
            guard let destVC = segue.destination as? PhotoViewController else {return}
//            guard let indexPath = collectionView?.indexPath(for: destVC) else {return}
            guard let indexPath = collectionView?.indexPathsForSelectedItems?.first else {return}
            let photo = photoController.photos[indexPath.item]
            destVC.photo = photo
            
        } else if segue.identifier == "AddSegue"{
            
            guard let destVC = segue.destination as? PhotoViewController else {return}
            destVC.photoController = photoController
            destVC.themeHelper = themeHelper
            
        } else if segue.identifier == "ThemeSegue"{
            guard let destVC = segue.destination as? ThemeSelectionViewController else {return}
            destVC.themeHelper = themeHelper
            
        }
        
    }

}
