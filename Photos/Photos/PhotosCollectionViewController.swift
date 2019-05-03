//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Victor  on 5/2/19.
//  Copyright © 2019 com.Victor. All rights reserved.
//

import Foundation
import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setTheme(_ sender: Any) {
        performSegue(withIdentifier: "setThem", sender: self)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PhotosCollectionViewCell
        
        
        let photo = photoController.photos[indexPath.item]
        
        cell.photo = photo
        
        cell.imageTitle.text = photo.title
        cell.photo?.imageData = photo.imageData
        
        return cell
    }
    
    
}
