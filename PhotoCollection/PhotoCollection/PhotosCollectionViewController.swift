//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Ry Bautista on 7/25/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    
    let themeHelper = ThemeHelper()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = themeHelper.setTheme()
        collectionView.backgroundColor = .clear
        collectionView.reloadData()
    }

    // MARK: - Navigation

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
    
        // Configure the cell
    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "PhotosCellSegue":
            guard let detailVC = segue.destination as? PhotoDetailViewController else {return}
            if let indexPath = collectionView.indexPathsForSelectedItems{
                detailVC.photo = photoController.photos[indexPath[0].item]
                detailVC.photoController = photoController
                detailVC.themeHelper = themeHelper
            }
        case "selectThemeSegue":
            guard let themeSelectionVC = segue.destination as? ThemeSelectionViewController else {return}
            themeSelectionVC.themeHelper = themeHelper
        case "AddPhotoShowSegue":
            guard let detailVC = segue.destination as? PhotoDetailViewController else {return}
            detailVC.photoController = photoController
            detailVC.themeHelper = themeHelper
        default:
            return
        }
    }
}

extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 100)
    }
}
