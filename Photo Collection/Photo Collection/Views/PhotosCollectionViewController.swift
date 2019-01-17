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
        setTheme()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        setTheme()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        switch segue.identifier {
        case "themeSegue":
             let themeVC = segue.destination as! ThemeSelectionViewController
             themeVC.themeHelper = themeHelper
        case "createSegue":
            let detailVC = segue.destination as! PhotoDetailViewController
            detailVC.photoController = photoController
            detailVC.themeHelper     = themeHelper
           
        case "cellSegue":
            let cellVC = segue.destination as? PhotoDetailViewController
            let cell = sender as? UICollectionViewCell
            let indexPath = collectionView.indexPath(for: cell!)
            cellVC?.themeHelper      = themeHelper
            cellVC?.photo            = photoController.photos[indexPath!.item]
        default:
             fatalError("segue could not be prepared for")
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
        
        let photo = photoController.photos[indexPath.item]
        unwrappedCell.imageView.image = UIImage(data: photo.imageData)
        unwrappedCell.photoLabel.text = photo.title
    
        return unwrappedCell
    }
    
    func setTheme() {
        if themeHelper.themePreference == nil  {
            themeHelper.setThemePreferenceToDark()
            self.collectionView.backgroundColor = UIColor.darkGray
            return
        }
        if (themeHelper.themePreference?.contains("Dark"))!{
            self.collectionView.backgroundColor = UIColor.darkGray
            return
        }
        if (themeHelper.themePreference?.contains("Blue"))!{
            self.collectionView.backgroundColor = UIColor.cyan
            return
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

