//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Kenny on 12/19/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PhotoDetailController {
            if segue.identifier == "PhotoDetailVCSegue" { //PhotoDetailVCSegue (cell) //themeHelper, photoController, photo
                //unwrap the cell, then the cell's indexPath to access the "row"
                guard let cell = sender as? UICollectionViewCell,
                let indexPath = self.collectionView.indexPath(for: cell) else {return}
                
                destination.photo = photoController.photos[indexPath.row]
                destination.themeHelper = themeHelper
                destination.photoController = photoController
                
            } else if segue.identifier == "AddPhotoSegue" { //AddPhotoSegue (addBtn) //themeHelper, photoController
                destination.themeHelper = themeHelper
                destination.photoController = photoController
            }
        } else {
            guard let destination = segue.destination as? ThemeSelectionViewController else {return} //themeHelper
            destination.themeHelper = themeHelper
        }
        //SelectThemeSegue (to theme VC)
    }
    
    //MARK: Helper Methods
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else {return}
        if themePreference == "Dark" {
            self.collectionView.backgroundColor = UIColor(named: "Dark")
        }
    }
    
}

extension PhotosCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        
        cell.photo = photoController.photos[indexPath.row]
        return cell
        
    }
    
    
}
