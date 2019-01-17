//
//  PhotosCollectionViewController.swift
//  PhotoCollection Project
//
//  Created by Michael Flowers on 1/16/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    //shared instance we will pass these values via segue
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "cellSelectedSegue" {
            //2. get destination, 3. cast sender as uicollectionviewcell, 3a. get indexptahforcell
            guard let toDestinationVC = segue.destination as? PhotoDetailViewController, let cell = sender as? UICollectionViewCell, let indexPath = collectionView.indexPath(for: cell) else { return }
            
            //4. get model object, subscripting its array with the indexPath.item
            let photo = photoController.photos[indexPath.item]
            
            //pass the model object to Destination vc proptery photo
            toDestinationVC.photo = photo
            toDestinationVC.photoController = photoController
            toDestinationVC.themeHelper = themeHelper
            
        } else if segue.identifier == "toAddPhoto" {
            guard let toDestinationVC = segue.destination as? PhotoDetailViewController else { return }
            toDestinationVC.photoController = photoController
            toDestinationVC.themeHelper = themeHelper
        } else if segue.identifier == "selectThemeSegue" {
            guard let toDestinationVC = segue.destination as? ThemeSelectionViewController else { return }
            toDestinationVC.themeHelper = themeHelper
        }
    }
 

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotosCollectionViewCell
        
        //find the model object withint the collection view
        let photo = photoController.photos[indexPath.item]
        
        //now that I have the photo object, I can pass it to the collectionViewCell file
        cell.photo = photo
    
        return cell
    }
    
    func setTheme(){
        //check to see if thre is a value in themeHelper
        guard let currentPrefrence = themeHelper.themePreference else { return }
        
        //check to see what the value is
        if currentPrefrence == "Dark" {
            collectionView.backgroundColor = .brown
        } else {
            collectionView.backgroundColor = .cyan
        }
        
    }
    

}
