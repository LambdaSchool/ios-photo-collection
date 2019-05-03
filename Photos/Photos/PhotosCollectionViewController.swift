//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Victor  on 5/2/19.
//  Copyright © 2019 com.Victor. All rights reserved.
//

import Foundation
import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    //passing controllers
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    //loads data
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
    }
    
    //segue to theme selection view controller
    @IBAction func setTheme(_ sender: Any) {
        performSegue(withIdentifier: "setTheme", sender: self)
    }
    
    //returns photos in array
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }
    
    //logic to transfer data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "add" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController else {return}
            //transfers controllers
            photoDetailVC.photoController = photoController
            photoDetailVC.themeHelper = themeHelper
        } else if segue.identifier == "Cell" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController, let cell = sender as? PhotosCollectionViewCell else {return}
            photoDetailVC.photoController = photoController
            //transfers object for update
            photoDetailVC.photo = cell.photo
            photoDetailVC.themeHelper = themeHelper
        } else if segue.identifier == "setTheme" {
            guard let selectThemeController = segue.destination as? ThemeSelectionViewController else { return }
            selectThemeController.themeHelper = themeHelper
        }
        
    }
    
    //configure cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PhotosCollectionViewCell
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        
        //customize cell
        
        
        return cell
    }
    
    //sets theme 
    func setTheme() {
        
        guard let theme = themeHelper.themePreference else { return }
        if theme == "Light" {
            collectionView.backgroundColor = .white
        } else if theme == "Dark" {
            collectionView.backgroundColor = .lightGray
        } 
    }
    
}
