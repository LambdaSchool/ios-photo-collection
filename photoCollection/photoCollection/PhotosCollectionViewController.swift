//
//  PhotosCollectionViewController.swift
//  photoCollection
//
//  Created by beth on 1/30/20.
//  Copyright © 2020 elizabeth wingate. All rights reserved.
//


//Part7
import UIKit


//step 2
class PhotosCollectionViewController: UICollectionViewController {

    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClickedPhoto", for: indexPath) as? PhotosCollectionViewCell else {
            return UICollectionViewCell() }
    
        // Configure the cell
        
        let photo = photoController.photos[indexPath.row]
        
        cell.photo = photo
    
        return cell
    }

    //6. Implement the `prepareForSegue`. You should have three segues to handle.
   // - The segue from the cell should pass the `themeHelper`, `photoController`, and the `photo`.
    //- The segue from the "Add" bar button item should pass the the `themeHelper` and the `photoController`.
    //- The segue from the "Select Theme" bar button item should pass the `themeHelper`.
    
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
    
  //part 7 - step5
    private func setTheme() {
        guard let themePreference = themeHelper.themePreferenceKey else { return }
        switch themePreference {
        case ThemeHelper.PropertyKeys.dark:
            collectionView.backgroundColor = .darkGray
        case ThemeHelper.PropertyKeys.white:
            collectionView.backgroundColor = .white
        default:
            collectionView.backgroundColor = .white
        }
    }

}
