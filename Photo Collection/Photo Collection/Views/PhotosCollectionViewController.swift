//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Angel Buenrostro on 1/16/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

private let reuseIdentifier = "photocell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        switch segue.identifier {
        case "themeSegue":
            guard let themeVC = segue.destination as? ThemeSelectionViewController else { return }
            themeVC.themeHelper = themeHelper
        case "createSegue":
            guard let detailVC = segue.destination as? PhotoDetailViewController else { return }
            detailVC.photoController = photoController
            detailVC.themeHelper     = themeHelper
//        case "cellSegue":
//            let tap = self.collectionView.indexPath(for: sender as! UICollectionViewCell)
//
//            if photoController.photos.count != 0 {
//                tap
//                photoController.Update(photo: <#T##Photo#>, data: <#T##Data#>, string: <#T##String#>)
//            }
//            guard let cellVC = segue.destination as?
        default:
            return
        }
        // Pass the selected object to the new view controller.
    }
    

    // MARK: UICollectionViewDataSource



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photocell", for: indexPath)
        guard let unwrappedCell = cell as? PhotosCollectionViewCell else { fatalError("No photo cell")}
        cell.tag = indexPath.item
        
        let photo = photoController.photos[indexPath.item]
        unwrappedCell.imageView.image = UIImage(data: photo.imageData)
        unwrappedCell.photoLabel.text = photo.title
    
        return unwrappedCell
    }
    
    func setTheme() {
        if themeHelper.themePreference != nil {
            let preference = themeHelper.themePreference
            self.collectionView.backgroundColor = (preference == "dark") ? .black : .blue
        }
        
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
