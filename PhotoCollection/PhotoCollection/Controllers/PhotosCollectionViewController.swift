//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Karen Rodriguez on 2/26/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper(themePreferenceKey: "key123")

    override func viewDidLoad() {
        super.viewDidLoad()
        print(themeHelper.themePreference)
        setTheme()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    override func viewWillAppear(_ animated: Bool) {
        setTheme()
    }


    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DetailViewSegue" {
            guard let detailVC = segue.destination as? PhotoDetailViewController,
                let indexPath = self.collectionView.indexPathsForSelectedItems else {fatalError()}
            detailVC.themeHelper = self.themeHelper
            detailVC.photoController = self.photoController
            detailVC.photo = photoController.photos[indexPath[0].row]
            
            
            
        } else if segue.identifier == "AddPhotoSegue" {
            guard let addVC = segue.destination as? PhotoDetailViewController else {fatalError()}
            addVC.themeHelper = self.themeHelper
            addVC.photoController = self.photoController
            
            
        } else if segue.identifier == "SelectThemeSegue" {
            guard let themeVC = segue.destination as? ThemeSelectionViewController else {fatalError()}
            themeVC.themeHelper = self.themeHelper
            
            
        }
        
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { fatalError() }
        cell.photo = photoController.photos[indexPath.row]
    
        // Configure the cell
    
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


//MARK: - ThemeHelper methods extensions

    func setTheme() {
        guard let preference = themeHelper.themePreference else {return}
        
        if preference == "Dark" {
            self.collectionView.backgroundColor = .black
        } else if preference == "Green" {
            self.collectionView.backgroundColor = .green        }
    }
}
