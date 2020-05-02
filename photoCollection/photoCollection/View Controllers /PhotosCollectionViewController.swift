//
//  PhotosCollectionViewController.swift
//  photoCollection
//
//  Created by Sammy Alvarado on 4/30/20.
//  Copyright © 2020 Sammy Alvarado. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let themeHelper = segue.destination as? UINavigationController,
//            let themeVC = themeHelper.viewControllers.first as? ThemeHelper {
//            themeVC.delegate = self
//        }
//            let photoController = segue.destination as? photoController,
//            let photo = segue.destination as? photo,
//    }
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
    
        let photo = photoController.photos[indexPath.item]
//        cell.photoImageView.image = photo.imageData
        cell.photoLabel.text = photo.title
        
        return cell
    }

    func setTheme(){
       if themeHelper.themePreference == "Dark" {
            return setTheme()
        }
    }

}

