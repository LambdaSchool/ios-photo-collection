//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Cody Morley on 8/3/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    //MARK: - Properties -
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    
    //MARK: - Life Cycles -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        setTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }

    
    // MARK: - Navigation -
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        switch segue.identifier {
        case String.addSegue:
            if let addVC = segue.destination as? PhotoDetailViewController {
                addVC.photoController = photoController
                addVC.themeHelper = themeHelper
            }
        case String.detailSegue:
            if let detailVC = segue.destination as? PhotoDetailViewController {
                detailVC.photoController = photoController
                detailVC.themeHelper = themeHelper
                if let indexPath = self.collectionView.indexPathsForSelectedItems?.first?.item {
                    detailVC.photo = photoController.photos[indexPath]
                }
            }
        case String.themeSegue:
            if let themeVC = segue.destination as? ThemeSelectionViewController {
                themeVC.themeHelper = themeHelper
            }
        default:
            NSLog("Tried a segue ID that does not exist.")
        }
    }
    

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell, let themePreference = themeHelper.themePreference else { return UICollectionViewCell() }
        
        cell.photo = photoController.photos[indexPath.item]
        cell.theme = themePreference
        return cell
    }
    
    
    //MARK: - Methods -
    private func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        
        switch themePreference {
        case themeHelper.darkValue:
            view.backgroundColor = UIColor.black
            collectionView.backgroundColor = UIColor.black
        case themeHelper.lambdaValue:
            collectionView.backgroundColor = UIColor.white
        default:
            print("No theme data for collection view.")
        }
    }
}
