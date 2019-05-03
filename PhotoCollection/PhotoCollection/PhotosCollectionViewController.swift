//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Jonathan Ferrer on 5/2/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
//    let photo: Photo? = nil
    

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
        setTheme()
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowPhoto" {
            let cellVC: PhotoDetailViewController = segue.destination as! PhotoDetailViewController
            cellVC.themeHelper = themeHelper
            cellVC.photoController = photoController
            guard let cell = sender as? PhotoCollectionViewCell else {return}
            guard let indexPath = collectionView.indexPath(for: cell) else {return}
            cellVC.photo = photoController.photos[indexPath.item]
        } else if segue.identifier == "AddPhoto" {
            guard let destinationVC = segue.destination as? PhotoDetailViewController else {return}
            destinationVC.themeHelper = themeHelper
            destinationVC.photoController = photoController
//            let addVC: PhotoDetailViewController = segue.destination as! PhotoDetailViewController
//            addVC.themeHelper = themeHelper
//            addVC.photoController = photoController
        } else if segue.identifier == "SelectTheme" {
            guard let selectVC = segue.destination as? ThemeSelectionViewController else { return }
            selectVC.themeHelper = themeHelper
        }
    }
 

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return photoController.photos.count
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell()}
        let photo = photoController.photos[indexPath.item]
        
        cell.photo = photo
        // Configure the cell
    
        return cell
    }
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        switch themePreference {
        case "Dark":
            collectionView.backgroundColor = #colorLiteral(red: 0.07058823529, green: 0.07058823529, blue: 0.07058823529, alpha: 1)
        case "Blue":
            collectionView.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        default :
            return
        }
    }

 

}
