//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Jeffrey Santana on 7/25/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		setTheme()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		collectionView.reloadData()
	}

    
    // MARK: - Navigation
	
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photoDetailVC = segue.destination as? PhotoDetailViewController {
			if let indexPath = collectionView.indexPathsForSelectedItems?.first {
				let photo = photoController.photos[indexPath.item]
				photoDetailVC.photo = photo
			}
			photoDetailVC.photoController = photoController
            photoDetailVC.themeHelper = themeHelper
    
        } else if let themeSelectionVC = segue.destination as? ThemeSelectionViewController {
            themeSelectionVC.themeHelper = themeHelper
			themeSelectionVC.delegate = self
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else { return UICollectionViewCell() }
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
    
        return cell
    }

    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        collectionView.backgroundColor = UIColor(named: themePreference)
    }

}

extension PhotosCollectionViewController: ThemeSelectionViewControllerDelegate {
	func themeUpdated() {
		setTheme()
		dismiss(animated: true, completion: nil)
	}
}
