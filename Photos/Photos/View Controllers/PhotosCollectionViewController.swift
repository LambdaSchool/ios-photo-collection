//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Breena Greek on 2/20/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        
        let photo = photoController.photos[indexPath.item]
    
        cell.photo = photo
        return cell
    }
    
    func setTheme () {
        if let themeHelper = themeHelper.themePreference{
            if themeHelper == "Dark" {
                self.view.backgroundColor = .gray
            } else if themeHelper == "Purple" {
                self.view.backgroundColor = .purple
            } else if themeHelper == nil {
                self.view.backgroundColor = .purple
            }
        }
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhotShowSegue" {
            guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
                
            destinationVC.photoController = photoController
        }
    }
}
