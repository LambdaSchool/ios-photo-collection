//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Nathanael Youngren on 1/16/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        setTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCellID", for: indexPath)
        guard let photoCell = cell as? PhotosCollectionViewCell else { return cell }
    
        let image = UIImage(data: photoController.photos[indexPath.item].imageData)
        photoCell.imageView.image = image
        photoCell.textLabel.text = photoController.photos[indexPath.item].title
    
        return photoCell
    }
    
    func setTheme() {
        guard let currentTheme = themeHelper.themePreference else { return }
        
        if currentTheme == "Dark" {
            collectionView.backgroundColor = .gray
        } else if currentTheme == "Yellow" {
            collectionView.backgroundColor = .yellow
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddSegue" {
            guard let addVC = segue.destination as? PhotoDetailViewController else { return }
            addVC.themeHelper = themeHelper
            addVC.photoController = photoController
        } else if segue.identifier == "EditSegue" {
            guard let editVC = segue.destination as? PhotoDetailViewController,
            let cell = sender as? PhotosCollectionViewCell,
            let indexPath = collectionView.indexPath(for: cell) else { return }
            editVC.themeHelper = themeHelper
            editVC.photoController = photoController
            editVC.photo = photoController.photos[indexPath.item]
        } else if segue.identifier == "ThemeSegue" {
            guard let themeVC = segue.destination as? ThemeSelectionViewController else { return }
            themeVC.themeHelper = themeHelper
        }
    }
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

}
