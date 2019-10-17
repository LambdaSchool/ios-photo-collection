//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by morse on 10/17/19.
//  Copyright © 2019 morse. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    struct PropertyKeys {
        static let cellID = "PhotoCell"
        static let addSegue = "AddPhotoShowSegue"
        static let editSegue = "EditPhotoShowSegue"
        static let themeSegue = "SelectThemeModalSegue"
    }
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
//    var themeSetting:  {
//        didSet {
//            setTheme()
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        setTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        setTheme()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case PropertyKeys.addSegue:
            guard let detailVC = segue.destination as? PhotoDetailViewController else { return }
            detailVC.themeHepler = themeHelper
            detailVC.photoController = photoController
        case PropertyKeys.editSegue:
            guard let detailVC = segue.destination as? PhotoDetailViewController, let cell = sender as? PhotoCollectionViewCell, let indexPath = self.collectionView.indexPath(for: cell) else { return }
            
            let photo = photoController.photos[indexPath.item]
            detailVC.themeHepler = themeHelper
            detailVC.photoController = photoController
            detailVC.photo = photo
        case PropertyKeys.themeSegue:
            guard let themeVC = segue.destination as? ThemeSelectionViewController else { return }
            themeVC.modalPresentationStyle = .fullScreen
            themeVC.themeHelper = themeHelper
        default:
            return
        }
    }
    
    @IBAction func unwindToPhotosCollectionViewController(_ sender: UIStoryboardSegue) {
        setTheme()
        }
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PropertyKeys.cellID, for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
    
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
    
        return cell
    }
    
    // MARK: - Private
    private func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        
        switch themePreference {
        case ThemeHelper.PropertyKeys.dark:
            collectionView.backgroundColor = .darkGray
            
        default:
            collectionView.backgroundColor = .purple
        }
    }
}
