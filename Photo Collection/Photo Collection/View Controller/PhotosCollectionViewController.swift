//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Iyin Raphael on 9/13/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ImageCell"

class PhotosCollectionViewController: UICollectionViewController {




   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addPhoto"{
            guard let detailVC = segue.destination as? PhotoDetailViewController else {return}
            detailVC.photoController = photoController
        }else if segue.identifier = "showPhoto"{
            guard let detailV
        }
       
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else {return UICollectionViewCell()}
        let photo = photoController.photos[indexPath.item]
        cell.imageView.image = UIImage(data: photo.imageData)
        cell.textLabel.text = photo.title
        return cell
    }
    
    func setTheme(){
        guard let themePref = themeHelper.themePrefence else {return}
        collectionView?.backgroundColor = UIColor(named: themePref)
    }

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
}
