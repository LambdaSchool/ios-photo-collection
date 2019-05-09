//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Kobe McKee on 5/9/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setTheme()
        collectionView.reloadData()
    }
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        
        let photo = photoController.photos[indexPath.item]
        
        cell.photo = photo
    
        return cell
    }

 
    
    func setTheme() {
        let theme = themeHelper.themePreference
        print(theme)
        if theme == "Dark" {
            collectionView.backgroundColor = .darkGray
        } else if theme == "Blue" {
            collectionView.backgroundColor = UIColor(red: 0, green: 84, blue: 147, alpha: 1)
        }
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "PhotoDetailsSegue" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController else { return }
            photoDetailVC.photoController = photoController
            photoDetailVC.themeHelper = themeHelper
            guard let photoIndex = collectionView?.indexPathsForSelectedItems?.first?.item else { return }
            let photo = photoController.photos[photoIndex]
            photoDetailVC.photo = photo
        }
        else if segue.identifier == "AddPhotoSegue" {
            guard let addPhotoVC = segue.destination as? PhotoDetailViewController else { return }
            addPhotoVC.photoController = photoController
            addPhotoVC.themeHelper = themeHelper
        }
        else if segue.identifier == "SelectThemeSegue" {
            guard let themeVC = segue.destination as? ThemeSelectionViewController else { return }
            themeVC.themeHelper = themeHelper
        }
    }
    
    

}
