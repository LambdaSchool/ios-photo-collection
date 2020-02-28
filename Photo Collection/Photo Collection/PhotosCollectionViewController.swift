//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Harmony Radley on 2/27/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    let photoController = PhotoController()
    
    let themeHelper = ThemeHelper()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt
        indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
            "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else {
            fatalError("Cell is not a PhotosCollectionViewCell") }
    
        let photo = photoController.photos[indexPath.item]
        
        cell.photo = photo
    
        return cell
    }

    
    func setTheme() {
        var theme = themeHelper.themePreference
    }

}
