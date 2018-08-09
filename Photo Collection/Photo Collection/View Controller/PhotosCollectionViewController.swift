//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Iyin Raphael on 8/9/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit



class PhotosCollectionViewController: UICollectionViewController {
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

 

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhoto"{
            
        }
    }



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? PhotosCollectionViewCell else {return UICollectionViewCell()}
        let photo =  photoController.photos[indexPath.row]
        cell.imageView.image = UIImage(data:photo.imageData)
        cell.label.text = photo.title
        return cell
    }

    func setTheme(){
        guard let themePreference =  themeHelper.themePreference else {return}
        
        if themePreference == "Blue" {
            collectionView?.backgroundColor = UIColor.darkGray
        } else {
            collectionView?.backgroundColor = UIColor.blue
        }

        
    }
}
