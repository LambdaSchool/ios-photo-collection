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
        setTheme()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
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
        guard let themePreference = themeHelper.themePreference else { return }
        switch themePreference {
        case "Dark":
            collectionView.backgroundColor = #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1411764706, alpha: 1)
        case "Green":
            collectionView.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        default :
            return
        }
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell()}
        let photo = photoController.photos[indexPath.item]

        cell.photo = photo
        // Configure the cell

        return cell
    }


    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
}
