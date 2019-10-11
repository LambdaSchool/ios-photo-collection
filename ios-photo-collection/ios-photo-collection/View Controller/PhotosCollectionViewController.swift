//
//  PhotosCollectionViewController.swift
//  ios-photo-collection
//
//  Created by denis cedeno on 10/10/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }

    
    
    
    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        switch segue.identifier{
        case "addDetailShowSegue":
            if let photoVC = segue.destination as? PhotoDetailViewController{
                photoVC.themeHelper = themeHelper
                photoVC.photoController = photoController
            }
        case "cellDetailShowSegue":
            if let photoVC = segue.destination as? PhotoDetailViewController,
                let cell = sender as? UICollectionViewCell,
                let indexPath = collectionView!.indexPath(for: cell){
                photoVC.themeHelper = themeHelper
                photoVC.photoController = photoController
                photoVC.photo = photoController.photos[indexPath.item]
            }
        case "selectThemeSegue":
            if let themeVC = segue.destination as? ThemeSelectionViewController{
                themeVC.themeHelper = themeHelper
            }
        default: return
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else {fatalError()}
        // configured cell
        cell.photo = photoController.photos[indexPath.item]
    
        return cell
    }

    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else {return}
        
        if themePreference == "Dark"{
            collectionView.backgroundColor = UIColor.gray
        } else if themePreference == "Color"{
            collectionView.backgroundColor = UIColor.blue
        }
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
