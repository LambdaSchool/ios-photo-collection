//
//  PhotosCollectionViewController.swift
//  ios-photo-collection
//
//  Created by Benjamin Hakes on 11/28/18.
//  Copyright © 2018 Benjamin Hakes. All rights reserved.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = "cell"
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else {fatalError()}
        
        cell.nameLabel.text = photoController.photos[indexPath.row].title
        
        
        cell.imageView.image = UIImage(data: photoController.photos[indexPath.row].imageData)
        // Configure the cell
    
        return cell
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {fatalError("Unable to retreive layout")}
        
        let amount: CGFloat = 32
        layout.sectionInset = UIEdgeInsets(top:amount, left: amount, bottom: amount, right: amount)
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.headerReferenceSize = CGSize(width: collectionView.bounds.width, height: 32)
        
        
    }
    
    func setTheme(){
        guard let currentTheme = themeHelper.themePerference else {return}
        switch currentTheme{
        case "Dark":
            self.view.backgroundColor = .black
        case "Blue":
            self.view.backgroundColor = .blue
        default:
            self.view.backgroundColor = .black
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        guard let indexPath = collectionView?.indexPathsForSelectedItems?.first else {return}
        
        switch identifier{
        case "selectThemeSegue":
            guard let destination = segue.destination as? ThemeSelectionViewController else {return} // could put fatal errors
            destination.themeHelper = themeHelper
            
        case "showDetail":
            guard let destination = segue.destination as? PhotoDetailViewController else {return} // could put fatal errors
            destination.themeHelper = themeHelper
            destination.photoController = photoController
            destination.photo = photoController.photos[indexPath.item]
            
        case "addSegue":
            guard let destination = segue.destination as? PhotoDetailViewController else {return} // could put fatal errors
            
            destination.themeHelper = themeHelper
            destination.photoController = photoController
            
        default:
            return
        }
    }

}
