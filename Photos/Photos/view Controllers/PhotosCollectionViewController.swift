//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Marlon Raskin on 7/25/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {

	let photoController = PhotoController()
	let themeHelper = ThemeHelper()

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
        case "SetThemeSegue":
            guard let setThemeVC = segue.destination as? ThemeSelectionViewController else {return}
            setThemeVC.themeHelper = themeHelper
        case "AddPhotoSegue":
            guard let addPhotoVC = segue.destination as? AddPhotoViewController else {return}
            addPhotoVC.photoController = photoController
            addPhotoVC.themeHelper = themeHelper
        case "PhotoDetailSegue":
            guard let photoDetailVC = segue.destination as? AddPhotoViewController else {return}
            guard let photo = collectionView.indexPathsForSelectedItems else {return}
            
            
        default:
            ()
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }

//		let photo = photoController.photos[indexPath.item]

    
        // Configure the cell
    
        return cell
    }

}
