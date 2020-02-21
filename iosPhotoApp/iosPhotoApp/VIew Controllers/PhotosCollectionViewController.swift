//
//  PhotosCollectionViewController.swift
//  iosPhotoApp
//
//  Created by Jarren Campos on 2/20/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {

    var photoController: PhotoController
    let themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return photoController.photo.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotosCollectionViewCell else {
            return UICollectionViewCell() }
    
        // Configure the cell
        let photo = photoController.photo[indexPath.item]
        cell.photo = photo
        return cell
    }
    

}
