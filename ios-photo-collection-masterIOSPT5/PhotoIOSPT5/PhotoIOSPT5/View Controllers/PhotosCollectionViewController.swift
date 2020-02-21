//
//  PhotosCollectionViewController.swift
//  PhotoIOSPT5
//
//  Created by David Williams on 2/19/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {


    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
           super.viewDidLoad()
       
           // Register cell classes
           self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCell")
        view.backgroundColor = UIColor(named: .themePreferenceDark)
           // Do any additional setup after loading the view.
       }
    
       
       // MARK: - Navigation -
    
       // In a storyboard-based application, you will often want to do a little preparation before navigation
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using [segue destinationViewController].
           // Pass the selected object to the new view controller.
       }
       

       // MARK: UICollectionViewDataSource

       override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           
           return photoController.photos.count
       }

       override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
       
           // Configure the cell
       
           return cell
       }
       
       func setTheme() {
        
        
    }
      

       // MARK: UICollectionViewDelegate

      

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
       */

}
