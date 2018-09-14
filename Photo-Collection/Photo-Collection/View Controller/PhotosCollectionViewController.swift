//
//  PhotosCollectionViewController.swift
//  Photo-Collection
//
//  Created by Ilgar Ilyasov on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCollectionCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CollectionCellSegue" {
            guard let destionationVC = segue.destination as? PhotoDetailViewController else { return }
            
            destionationVC.themeHelper = themeHelper
            destionationVC.photoController = photoController
            //destionationVC.photo = 
            
        } else if segue.identifier == "AddButtonSegue" {
            guard let destionationVC = segue.destination as? PhotoDetailViewController else { return }
            destionationVC.themeHelper = themeHelper
            destionationVC.photoController = photoController
            
        } else if segue.identifier == "SelectThemeSegua"{
            guard let destionationVC = segue.destination as? ThemeSelectionViewController else { return }
            destionationVC.themeHelper = themeHelper
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell()}
        let thePhoto = photoController.photos[indexPath.item]
        
        cell.photo = thePhoto
        
        return cell
    }
    
//    func setTheme() {
//        guard let currentTheme = themeHelper.themePreference else { return }
//
//        if
//    }

}
