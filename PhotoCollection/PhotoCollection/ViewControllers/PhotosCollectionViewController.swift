//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Chris Price on 2/21/20.
//  Copyright © 2020 Chris Price. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {

    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var photoTitleLabel: UILabel!
    
    var photoController = PhotoController()
    var themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    func setTheme() {
        guard let themePreference = themeHelper.themePreference else {return}
        if themePreference == "Dark" {
            collectionView.backgroundView?.backgroundColor = .darkGray
        } else {
            collectionView.backgroundView?.backgroundColor = .blue
        }
    }
    
    
    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoDetailSegue" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController, let indexPath = collectionView?.indexPathsForSelectedItems?.first else {return}
            photoDetailVC.photo = photoController.photos[indexPath.item]
        } else if segue.identifier == "AddPhotoSegue" {
            let addPhotoVC = segue.destination as? PhotoDetailViewController
            addPhotoVC?.photoController = photoController
        } else if segue.identifier == "ThemeSelectionSegue" {
            let themeSelectionVC = segue.destination as? ThemeSelectionViewController
            themeSelectionVC?.themeHelper = themeHelper
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else {return UICollectionViewCell}
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        return cell
    }

    // MARK: UICollectionViewDelegate


}
