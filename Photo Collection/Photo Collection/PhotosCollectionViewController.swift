//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Cameron Dunn on 1/16/19.
//  Copyright © 2019 Cameron Dunn. All rights reserved.
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setTheme()
        collectionView.reloadData()
    }
    func setTheme(){
        guard let theme = themeHelper.themePreference else {return}
        if(theme == .dark){
            collectionView.backgroundColor = UIColor.darkGray
        }else if(theme == .light){
            collectionView.backgroundColor = UIColor.white
        }
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return photoController.photos.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PhotosCollectionViewCell
        cell?.imageView.image = photoController.photos[indexPath.item].image
        cell?.label.text = photoController.photos[indexPath.row].title
    
        return cell!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "CellTappedSegue"){
            guard let indexPath = collectionView.indexPathsForSelectedItems else {return}
            let destination = segue.destination as! PhotoDetailViewController
            destination.photo = photoController.photos[indexPath[0].item]
            destination.photoController = photoController
            destination.themeHelper = themeHelper
        }else if(segue.identifier == "SelectThemeSegue"){
            let destination = segue.destination as! ThemeSelectionViewController
            destination.themeHelper = themeHelper
            
        }else if(segue.identifier == "AddPhotoSegue"){
            let destination = segue.destination as! PhotoDetailViewController
            destination.photoController = photoController
            destination.themeHelper = themeHelper
        }else{
            let alert = UIAlertController(title: "Error", message: "Something went wrong, please try again. If the error persists please contact Andrew Madsen.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
        }
    }
}
