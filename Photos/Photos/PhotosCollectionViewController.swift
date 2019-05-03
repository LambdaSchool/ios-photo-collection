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
        collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    @IBAction func setTheme(_ sender: Any) {
        performSegue(withIdentifier: "setThem", sender: self)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController else {return}
            photoDetailVC.photoController = photoController
            
        } else if segue.identifier == "Cell" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController, let cell = sender as? PhotosCollectionViewCell else {return}
            photoDetailVC.photoController = photoController
            photoDetailVC.photo = cell.photo
        } else if segue.identifier == "setTheme" {
            //theme
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PhotosCollectionViewCell
        
        
        let photo = photoController.photos[indexPath.item]
        
        cell.photo = photo
        
        return cell
    }
    
    
}
