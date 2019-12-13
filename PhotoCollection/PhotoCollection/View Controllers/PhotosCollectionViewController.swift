//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Joshua Rutkowski on 12/12/19.
//  Copyright © 2019 Joshua Rutkowski. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

let photoController = PhotoController()
let themeHelper = ThemeHelper()

class PhotosCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
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

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell()}
    
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
    
        return cell
    }
    
    private func setTheme() {
         guard let themePreference = themeHelper.themePreferenceKey else { return }
         switch themePreference {
         case ThemeHelper.PropertyKeys.dark:
             collectionView.backgroundColor = .darkGray
         case ThemeHelper.PropertyKeys.blue:
             collectionView.backgroundColor = .blue
         default:
             collectionView.backgroundColor = .white
         }
     }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         switch segue.identifier {
         case String.addSegue:
             guard let detailVC = segue.destination as? PhotoDetailViewController else { return }
             detailVC.themeHelper = themeHelper
             detailVC.photoController = photoController
         case String.themeSegue:
             guard let themeVC = segue.destination as? ThemeSelectionViewController else { return }
             themeVC.modalPresentationStyle = .fullScreen
             themeVC.themeHelper = themeHelper
         default:
             return
         }
     }

}
