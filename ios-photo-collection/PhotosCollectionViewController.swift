//
//  PhotosCollectionViewController.swift
//  ios-photo-collection
//
//  Created by Taylor Lyles on 5/2/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import UIKit



class PhotosCollectionViewController: UICollectionViewController {
	
	let photoController = PhotoController()
	let themeHelper = ThemeHelper()
	
	func updateViews() {
		collectionView.reloadData()
		setTheme()
		
	}
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		updateViews()
	}

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath)
		
		guard let photoCell = cell as? PhotosCollectionViewCell else { return cell }
		photoCell.photo = photoController.photos[indexPath.item]
		
        return photoCell
		
    }

	func setTheme() {
		
		guard let newTheme = themeHelper.themePreference else {
			print("error unwrapping theme")
			return
			
		}
		if newTheme == "Dark" {
			collectionView.backgroundColor = .black
//			collectionView.backgroundView = UIView(frame: collectionView.bounds)
//			collectionView.backgroundView?.backgroundColor = .red
		} else {
			collectionView.backgroundColor = UIColor(red: 1.0, green: 136 / 255, blue: 253 / 255, alpha: 1.0)
		}
		
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//		AddPhoto
//		ViewPhoto
//		SelectTheme
		if segue.identifier == "AddPhoto" {
			guard let dest = segue.destination as? PhotoDetailViewController else { return }
			dest.themeHelper = themeHelper
			dest.photoController = photoController
		} else if segue.identifier == "ViewPhoto" {
			guard let dest = segue.destination as? PhotoDetailViewController else { return }
			guard let cell = sender as? PhotosCollectionViewCell else { return }
			guard let indexPath = collectionView.indexPath(for: cell) else { return }
			dest.themeHelper = themeHelper
			dest.photoController = photoController
			dest.photo = photoController.photos[indexPath.item]
		} else if segue.identifier == "SelectTheme" {
			guard let dest = segue.destination as? ThemeSelectionViewController else { return }
			dest.themeHelper = themeHelper
		}
		
	}
	
}
