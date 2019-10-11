//
//  PhotosCollectionViewController.swift
//  ios photo Collection
//
//  Created by Nicolas Rios on 10/1/19.
//  Copyright © 2019 Nicolas Rios. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

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

        
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             if segue.identifier == "photoCellSegue" {
                 guard let photoDetailVC = segue.destination as? PhotosDetailViewController else { return }
                
             } else if segue.identifier == "addPhotoSegue" {
                 guard let addPhotoVC = segue.destination as? PhotosDetailViewController else { return }
                 
             } else if segue.identifier == "selectThemeModalSegue" {
                 guard let selectThemeVC = segue.destination as? ThemeSelectionViewController else { return }
               
             }
         }
}
