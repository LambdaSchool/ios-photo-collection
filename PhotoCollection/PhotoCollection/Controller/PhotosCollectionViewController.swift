//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Shawn James on 3/26/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {

    // MARK: - Properties
    var photoController = PhotoController()
    var themeHelper = ThemeHelper()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setTheme()
        collectionView.reloadData()
    }

    // MARK: - Theme Methods
    
    func setTheme() {
        guard let theme = themeHelper.themePreference else { return }
        if theme == String.redTheme { collectionView.backgroundColor = .red } else { collectionView.backgroundColor = .blue }
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddSegue" {
            // Get the new view controller using [segue destinationViewController].
            guard let photoDetailViewController = segue.destination as? PhotoDetailViewController else { fatalError("AddSegue failure to downcast") }
            // Pass the selected object to the new view controller.
            photoDetailViewController.themeHelper = self.themeHelper
            photoDetailViewController.photoController = self.photoController
        } else if segue.identifier == "EditSegue" {
            // Get the new view controller using [segue destinationViewController].
            guard let photoDetailViewController = segue.destination as? PhotoDetailViewController,
                let indexPath = collectionView.indexPathsForSelectedItems?.first else { fatalError("EditSegue failure to downcast") }
            // Pass the selected object to the new view controller.
            photoDetailViewController.themeHelper = self.themeHelper
            photoDetailViewController.photoController = self.photoController
            photoDetailViewController.photo = photoController.photos[indexPath.row]
        } else if segue.identifier == "ThemeSegue" {
            // Get the new view controller using [segue destinationViewController].
            guard let themeSelectionViewController = segue.destination as? ThemeSelectionViewController else { fatalError("ThemeSegue failure to downcast") }
            // Pass the selected object to the new view controller.
            themeSelectionViewController.themeHelper = self.themeHelper
        }
    }


    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { photoController.photos.count }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { fatalError("failure to dequeue cell") }
        // Configure the cell
        cell.photo = photoController.photos[indexPath.row]
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


