//
//  PhotosCollectionViewController.swift
//  photoviewer
//
//  Created by Ian French on 4/30/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"




class PhotoCollectionViewController: UICollectionViewController {

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

   
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
     
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return photoController.photos.count
    }
    
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        cell.imageViewLabel.text  = photo.title
        

        return cell
    }
    
    
    func setTheme() {
        guard let theme = themeHelper.themePreference else { return }
        
        switch theme {
        case "Green":
            collectionView.backgroundColor = UIColor.green
        default:
            collectionView.backgroundColor = UIColor.darkGray
            
        }
    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "addPhotoDetailSegue" {
        if let photoDetailVC = segue.destination as? PhotoDetailViewController {
            photoDetailVC.themeHelper = themeHelper
            photoDetailVC.photoController = photoController
            }
            
            
    } else if  segue.identifier == "cellViewDetailSegue" {
         
            guard let photoDetailVC =  segue.destination as? PhotoDetailViewController,
                let cell = sender as? PhotoCollectionViewCell,
                let indexPath = collectionView.indexPath(for: cell) else { return }
       
            
            photoDetailVC.photo = photoController.photos[indexPath.row]
            photoDetailVC.themeHelper = themeHelper
            photoDetailVC.photoController = photoController
            
            
        } else {
    
            guard let themeVC = segue.destination as?
                ThemeSelectionViewController else { return}
                themeVC.themeHelper = themeHelper
        }
            
    
    
    }
    
    
    
    
}   // end of class

    


