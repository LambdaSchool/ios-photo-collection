//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by William Chen on 8/22/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoViewCell", for: indexPath) as? PhotosCollectionViewCell else {return UICollectionViewCell()}
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        
        
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhotoSegue" {
            guard let addVC = segue.destination as? PhotoDetailViewController else {return}
            addVC.themeHelper = themeHelper
            addVC.photoController = photoController
        } else if segue.identifier == "viewPhotoSegue" {
            guard let viewVC = segue.destination as? PhotoController else {return}
            viewVC.photoController = photoController
            viewVC.themeHelper = themeHelper
            guard let index = collectionView.indexPathsForSelectedItems?.first else {return}
            viewVC.photo = photoController.photos[index.item]
        } else if segue.identifier == "ThemeSegue" {
            guard let themeVC = segue.destination as? ThemeSelectionViewController else {return}
            themeVC.themeHelper = themeHelper
        }
    }

}
