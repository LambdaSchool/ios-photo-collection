//
//  PhotoCollectionViewController.swift
//  PhotoCollection2
//
//  Created by brian vilchez on 8/22/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit


class PhotoCollectionViewController: UICollectionViewController {

	let photoController = PhotoController()
	let themeHelper = ThemeHelper()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }

    // MARK: - Navigation

     //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPhotoDetailSegue" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController, let selectedIndexPath = collectionView?.indexPathsForSelectedItems?.first else {return}
                photoDetailVC.photo = photoController.photos[selectedIndexPath.item]
                photoDetailVC.photoController = photoController
            
        } else if segue.identifier == "addPhotoShowSegue" {
            guard let addPhotoVC = segue.destination as? PhotoDetailViewController else {return}
            addPhotoVC.photoController = photoController
        }
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        print(photoController.photos.count)
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else { return  UICollectionViewCell() }
		let photo = photoController.photos[indexPath.item]
		cell.photo = photo
        return cell
    }

    /// sets background theme to value of user defaults
	func setTheme() {
		if let selectedTheme = themeHelper.themePreference {
			if selectedTheme == "dark" {
                view.backgroundColor = .darkGray
        } else if selectedTheme == "blue" {
				view.backgroundColor = .blue
			}
		}
	}

}


