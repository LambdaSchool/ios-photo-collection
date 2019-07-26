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

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		collectionView.reloadData()
		setTheme()
	}

    override func viewDidLoad() {
        super.viewDidLoad()

    }

	func setTheme() {
		guard let theme = themeHelper.themePreference else { return }
		switch theme {
		case "Dark":
			collectionView.backgroundColor = Colors.dark
			navigationController?.navigationBar.barTintColor = Colors.dark
			navigationController?.navigationBar.tintColor = Colors.darkBGText
			navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: Colors.darkBGText]
		case "Raspberry Red":
			collectionView.backgroundColor = Colors.raspberryRed
			navigationController?.navigationBar.barTintColor = Colors.raspberryRed
			navigationController?.navigationBar.tintColor = Colors.redBGAccent
			navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: Colors.redBGAccent]
		default:
			()
		}
	}


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

		if let themedVC = segue.destination as? ThemeHelperAccessable {
			themedVC.themeHelper = themeHelper
		}

		if let photoVC = segue.destination as? AddPhotoViewController {
			photoVC.photoController = photoController
			if segue.identifier == "PhotoDetailSegue" {
				guard let indexPath = collectionView?.indexPathsForSelectedItems?.first else { return }
				let photo = photoController.photos[indexPath.item]
				photoVC.photo = photo
			}
		}
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }

		let photo = photoController.photos[indexPath.item]
		cell.themeHelper = themeHelper
		cell.photo = photo

        return cell
    }

}
