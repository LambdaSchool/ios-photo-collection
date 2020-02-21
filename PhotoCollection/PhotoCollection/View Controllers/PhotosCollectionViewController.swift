//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Lambda_School_Loaner_259 on 2/20/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper(themePreference: UserDefaults.standard.string(forKey: "themePreference"))

    override func viewDidLoad() {
        super.viewDidLoad()


        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell")

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
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        let photo = photoController.photos[indexPath.item]
        
        cell.photo = photo
        
        return cell
    }
    
    func setTheme() {
        guard let theme = themeHelper.themePreference else { return }
        if theme == "Dark" {
            view.backgroundColor = .black
        } else {
            view.backgroundColor = .white
        }
    }
}
