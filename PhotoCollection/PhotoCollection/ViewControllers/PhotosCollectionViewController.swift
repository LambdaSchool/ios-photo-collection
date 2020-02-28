//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Shawn Gee on 2/27/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController, ThemeHelperDelegate {
  
    //MARK: - Properties
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    
    //MARK: - Private
    
    private func setTheme() {
        let theme = themeHelper.themePreference
        view.backgroundColor = UIColor.init(named: theme)
    }
    
    
    //MARK: - View Lifecycle
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        themeHelper.delegate = self
    }

    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else {
            fatalError("Unable to dequeue cell of type: \(PhotosCollectionViewCell.self)")
        }
        
        cell.photo = photoController.photos[indexPath.item]
    
        return cell
    }


    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photoDetailVC = segue.destination as? PhotoDetailViewController {
            
            if segue.identifier == "ShowPhoto",
               let indexPath = collectionView.indexPathsForSelectedItems?.first {
                photoDetailVC.photo = photoController.photos[indexPath.item]
            }
            
            photoDetailVC.photoController = photoController
            photoDetailVC.themeHelper = themeHelper
            
        } else if let themeSelectionVC = segue.destination as? ThemeSelectionViewController {
            themeSelectionVC.themeHelper = themeHelper
        }
    }
}
