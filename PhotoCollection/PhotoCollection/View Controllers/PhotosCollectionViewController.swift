//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by David Wright on 12/12/19.
//  Copyright © 2019 David Wright. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {

    // MARK: Properties

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    // MARK: Methods

    func setTheme() {
        guard let theme = themeHelper.themePreference else { return }
        self.collectionView.backgroundColor = theme == "Dark" ? #colorLiteral(red: 0.1686089337, green: 0.1686392725, blue: 0.1686023176, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
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
        switch segue.identifier {
        case "ShowPhotoDetail":
            if let PhotoDetailVC = segue.destination as? PhotoDetailViewController,
                let indexPath = collectionView.indexPathsForSelectedItems?.first {
                PhotoDetailVC.themeHelper = self.themeHelper
                PhotoDetailVC.photoController = self.photoController
                PhotoDetailVC.photo = photoController.photos[indexPath.row]
            }
        case "AddPhoto":
            if let PhotoDetailVC = segue.destination as? PhotoDetailViewController {
                PhotoDetailVC.themeHelper = self.themeHelper
                PhotoDetailVC.photoController = self.photoController
            }
        case "SelectTheme":
            if let themeSelectionVC = segue.destination as? ThemeSelectionViewController {
                themeSelectionVC.themeHelper = self.themeHelper
            }
        default:
            print("Error: Unexpected segue identifer.")
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
    
        // Configure the cell
        cell.photo = photoController.photos[indexPath.item]
        
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
