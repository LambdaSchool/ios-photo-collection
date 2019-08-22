//
//  PhotoCollectionViewController.swift
//  PhotoCollection2
//
//  Created by brian vilchez on 8/22/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotoCollectionViewController: UICollectionViewController {

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

     //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "themeSelectorModalSegue" {
			guard let themeSelectorVC = segue.destination as? ThemeSelectionViewController else { return }
			themeSelectorVC.themeHelper = themeHelper
		} else if segue.identifier == "addPhotoShowSegue" {
			guard let photoDetailVC = segue.destination as? PhotoDetailViewController, let selectedIndexPath = collectionView.indexPathsForSelectedItems else { return }
		//	let photo = photoController.photos[selectedIndexPath.item]
			photoDetailVC.themeHelper = themeHelper
		//	photoDetailVC.photo = photo
		} else if segue.identifier == "ShowPhotoDetailSeguea" {
			guard let photoDetailVC = segue.destination as? PhotoDetailViewController else { return }
			photoDetailVC.photoController = photoController
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
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell else { return  UICollectionViewCell() }
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


