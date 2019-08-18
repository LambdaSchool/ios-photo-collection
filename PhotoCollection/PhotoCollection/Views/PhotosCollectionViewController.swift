//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Joel Groomer on 8/15/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    var selectedPhotoIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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
        if segue.identifier == "segueShowPhotoDetailView" {
            guard let selected = selectedPhotoIndexPath,
                  let vc = segue.destination as? PhotoDetailViewController else { return }
            vc.themeHelper = themeHelper
            vc.photoController = photoController
            vc.photo = photoController.photos[selected.item]
        } else if segue.identifier == "segueShowNewPhotoDetailView" {
            guard let vc = segue.destination as? PhotoDetailViewController else { return }
            vc.themeHelper = themeHelper
            vc.photoController = photoController
        } else if segue.identifier == "segueModalSelectTheme" {
            guard let vc = segue.destination as? ThemeSelectionViewController else { return }
            vc.themeHelper = themeHelper
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        
        cell.photo = photoController.photos[indexPath.item]
        return cell
    }

    // MARK: UICollectionViewDelegate

    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if selectedPhotoIndexPath == indexPath {
            selectedPhotoIndexPath = nil
            return false
        } else {
            selectedPhotoIndexPath = indexPath
            return true
        }
    }
    
    func setTheme() {
        guard let theme = themeHelper.themePreference else { return }
        
        switch theme {
        case "Blue":
            collectionView.backgroundColor = .blue
        case "Dark":
            collectionView.backgroundColor = .lightGray
        default:
            collectionView.backgroundColor = .white
        }
    }

}
