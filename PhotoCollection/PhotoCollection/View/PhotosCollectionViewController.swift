//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Shawn James on 2/27/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    
    // MARK: - Properties
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
    }

    override func viewWillAppear(_ animated: Bool) {
        setTheme()
        collectionView.reloadData()
    }
    
    private func setTheme() {
        switch themeHelper.themePreference {
        case ThemeHelper.redTheme:
            collectionView.backgroundColor = .red
        default:
            collectionView.backgroundColor = .blue
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photoDetailVC = segue.destination as? PhotoDetailViewController {
            if segue.identifier == "EditPhoto", let indexPath = collectionView.indexPathsForSelectedItems?.first {
                photoDetailVC.photo = photoController.photos[indexPath.item]
            }
            photoDetailVC.photoController = photoController
            photoDetailVC.themeHelper = themeHelper
        } else if let themeSelectionVC = segue.destination as? ThemeSelectionViewController {
            themeSelectionVC.themeHelper = themeHelper
        } else if let photoDetailVC = segue.destination as? PhotoDetailViewController {
            photoDetailVC.photoController = photoController
            photoDetailVC.themeHelper = themeHelper
        }
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { fatalError("dequeue cell error") }
        cell.photo = photoController.photos[indexPath.item]
        return cell
    }
}
