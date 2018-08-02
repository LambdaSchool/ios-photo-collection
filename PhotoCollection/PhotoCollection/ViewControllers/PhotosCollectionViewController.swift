//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Carolyn Lea on 8/2/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController
{
    let photoController = PhotoController()
    //let themeHelper = ThemeHelper(themePreference: "", preferenceKey: "")
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "ToAddView"
        {
            guard let addView = segue.destination as? PhotoDetailViewController else {return}
            addView.photoController = photoController
        }
        else if segue.identifier == "ToEditView"
        {
            guard let editView = segue.destination as? PhotoDetailViewController, let cell = sender as! PhotosCollectionViewCell?,
                let indexPath = collectionView?.indexPath(for: cell) else {return}
            editView.photoController = photoController
            editView.photo = photoController.photos[indexPath.row]
        }
        else if segue.identifier == "ShowTheme"
        {
            guard let themeView = segue.destination as? ThemeSelectionViewController else {return}
        }
        
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell
    
        let photo = photoController.photos[indexPath.row]
        cell.imageView.image = UIImage(data: photo.imageData)
        cell.titleLabel.text = photo.title
    
        return cell
    }

    

}
