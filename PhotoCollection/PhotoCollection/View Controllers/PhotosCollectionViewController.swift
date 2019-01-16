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

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
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
        guard let key = UserDefaults.standard.string(forKey: themeHelper.themePreferenceKey) else { return }
        
        if key == "Dark" {
            view.backgroundColor = .gray
        } else if key == "Yellow" {
            view.backgroundColor = .yellow
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddSegue" {
            guard let addVC = segue.destination as? PhotoDetailViewController,
            let cell = sender as? PhotosCollectionViewCell else { return }
            addVC.themeHelper = cell.themeHelper
            addVC.photoController = cell.photoController
        } else if segue.identifier == "EditSegue" {
            guard let editVC = segue.destination as? PhotoDetailViewController,
            let cell = sender as? PhotosCollectionViewCell else { return }
            editVC.themeHelper = cell.themeHelper
            editVC.photoController = cell.photoController
            editVC.photo = cell.photo
        } else if segue.identifier == "ThemeSegue" {
            guard let themeVC = segue.destination as? ThemeSelectionViewController,
            let cell = sender as? PhotosCollectionViewCell else { return }
            themeVC.themeHelper = cell.themeHelper
        }
    }
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

}
