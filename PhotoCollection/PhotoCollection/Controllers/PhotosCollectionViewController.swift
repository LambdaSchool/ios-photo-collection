//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Jeffrey Santana on 7/25/19.
//  Copyright © 2019 admin. All rights reserved.
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photoDetailVC = segue.destination as? PhotoDetailViewController {
            guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
            let photo = photoController.photos[indexPath.item]
            photoDetailVC.photo = photo
            photoDetailVC.themeHelper = themeHelper
    
        } else if let themeSelectionVC = segue.destination as? ThemeSelectionViewController {
            themeSelectionVC.themeHelper = themeHelper
        }
        
        
        
        
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCell else { return UICollectionViewCell()}
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        collectionView.backgroundColor = UIColor(named: themePreference)
    }

}
