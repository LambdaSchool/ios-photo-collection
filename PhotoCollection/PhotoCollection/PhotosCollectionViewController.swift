//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Jonathan Ferrer on 5/9/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
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


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPhoto" {
            let destinationVC = segue.destination as! PhotoDetailViewController
            destinationVC.themeHelper = themeHelper
            destinationVC.photoController = photoController

            guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
            destinationVC.photo = photoController.photos[indexPath.item]
        } else if segue.identifier  == "AddPhoto" {
            let destinationVC = segue.destination as! PhotoDetailViewController
            destinationVC.themeHelper = themeHelper
            destinationVC.photoController = photoController
        } else if segue.identifier == "SelectTheme" {
            let destinationVC = segue.destination as! ThemeSelectionViewController
            destinationVC.themeHelper = themeHelper
        }
    }

    func setTheme() {
        let currentTheme = themeHelper.themePreference
        if currentTheme == "Dark" {
            collectionView.backgroundColor = #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1411764706, alpha: 1)
        } else if currentTheme == "Green" {
            collectionView.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        }
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell

        let photo = photoController.photos[indexPath.item]

        cell.photoImageView.image = UIImage(data: photo.imageData)
        cell.photoLabel.text = photo.title
    
        // Configure the cell
    
        return cell
    }



    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
}
