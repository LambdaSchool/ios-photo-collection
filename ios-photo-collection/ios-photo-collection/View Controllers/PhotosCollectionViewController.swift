//
//  PhotosCollectionViewController.swift
//  ios-photo-collection
//
//  Created by Matthew Martindale on 2/19/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController, preferenceDelegate {

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    let photo: Photo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func themePreferred(colorString: String) {
        if colorString == "Dark" {
            self.collectionView.backgroundColor = #colorLiteral(red: 0.1764146984, green: 0.1993693411, blue: 0.2962295413, alpha: 1)
        } else if colorString == "Gold" {
            self.collectionView.backgroundColor = #colorLiteral(red: 1, green: 0.8357229829, blue: 0, alpha: 1)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhotoSegue" {
            guard let addPhotoVC = segue.destination as? PhotoDetailViewController else { return }
            addPhotoVC.photoController = photoController
            addPhotoVC.themeHelper = themeHelper
        } else if segue.identifier == "DetailPhotoSegue" {
            guard let detailVC = segue.destination as? PhotoDetailViewController else { return }
            detailVC.themeHelper = themeHelper
            detailVC.photoController = photoController
            detailVC.photo = photo
        } else if segue.identifier == "ThemeSegue" {
            guard let themeVC = segue.destination as? ThemeSelectionViewController else { return }
            themeVC.themeHelper = themeHelper
            themeVC.delegate = self
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath)
            as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        return cell
    }

}


