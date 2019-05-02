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
	

    override func viewDidLoad() {
        super.viewDidLoad()
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

}
