//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Breena Greek on 2/20/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    // MARK Properties
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell }
        
        let photo = photoController.photos[indexPath.item]
    
        cell.photo = photo
        return cell
    }
    
    func setTheme () {
        if themeHelper = themeHelper.setThemePreferenceToDark() {
            self.view.backgroundColor = .gray
        } else if themeHelper = themeHelper.setThemePreferenceToPurple() {
            self.view.backgroundColor = .purple
        } else if themeHelper == nil {
            self.view.backgroundColor = .purple
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectThemeModalSegue" {
            if let themeVC = segue.destination as? ThemeSelectionViewController {
                themeVC.themehelper = themehelper
            }
        }
    }
}
