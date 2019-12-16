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
        collectionView.backgroundColor = themeHelper.themeColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        //collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        setTheme()
    }

    override func viewWillAppear(_ animated: Bool) {
        setTheme()
        collectionView.reloadData()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ShowPhotoDetail":
            if let PhotoDetailVC = segue.destination as? PhotoDetailViewController,
                let indexPath = collectionView.indexPathsForSelectedItems?.first {
                PhotoDetailVC.themeHelper = themeHelper
                PhotoDetailVC.photoController = photoController
                PhotoDetailVC.photo = photoController.photos[indexPath.row]
            }
        case "AddPhoto":
            if let PhotoDetailVC = segue.destination as? PhotoDetailViewController {
                PhotoDetailVC.themeHelper = themeHelper
                PhotoDetailVC.photoController = photoController
            }
        case "SelectTheme":
            if let themeSelectionVC = segue.destination as? ThemeSelectionViewController {
                themeSelectionVC.themeHelper = themeHelper
                themeSelectionVC.delegate = self
            }
        default:
            print("Error: Unexpected segue identifer: \(segue.identifier ?? "nil").")
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
    
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

extension PhotosCollectionViewController: themeSelectionDelegate {
    func themeWasSelected() {
        setTheme()
    }
}
