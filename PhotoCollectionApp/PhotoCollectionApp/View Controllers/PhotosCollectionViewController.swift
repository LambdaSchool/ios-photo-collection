//
//  PhotosCollectionViewController.swift
//  PhotoCollectionApp
//
//  Created by Nelson Gonzalez on 1/16/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView.reloadData()
        setTheme()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueFromCell" {
            guard let vc = segue.destination as? PhotoDetailViewController else {return}
            vc.photoController = photoController
            vc.themeHelper = themeHelper
            guard let cell = sender as? PhotosCollectionViewCell else {return}
            guard let indexPath = collectionView.indexPath(for: cell) else { return }
            let photo = photoController.photos[indexPath.item]
            vc.photo = photo
        } else if segue.identifier == "addButtonSegue" {
            guard let vc = segue.destination as? PhotoDetailViewController else {return}
            vc.photoController = photoController
            vc.themeHelper = themeHelper
        } else if segue.identifier == "selectThemeSegue" {
            guard let vc = segue.destination as? ThemeSelectionViewController else {return}
            vc.themeHelper = themeHelper
        }
    }
    

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotosCollectionViewCell
        
        let photo = photoController.photos[indexPath.item]
        let image = UIImage(data: photo.imageData)
        cell.photoImageView.image = image
        cell.descriptionLabel.text = photo.title
    
        // Configure the cell
    
        return cell
    }
    func setTheme(){
        guard let theme = themeHelper.themePreference else {return}
        
        switch theme {
        case "Light":
            collectionView.backgroundColor = .white
        case "Dark":
            collectionView.backgroundColor = .darkGray
        default:
            break
        }
        
    }

}
