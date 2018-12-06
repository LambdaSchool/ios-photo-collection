//
//  PhotoViewController.swift
//  PhotoCollection
//
//  Created by Sameera Leola on 12/6/18.
//  Copyright © 2018 Sameera Leola. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupCollectionViewLayout()
        collectionView.reloadData()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // 2. Get the number of photos
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PhotoModel.shared.numberOfPhotos
    }
    
    // 3. Dequeue the cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Dequeue the cells
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        //Get the photo for the indexPath
        let photo = PhotoModel.shared.photo(at: indexPath)
        //Create the image.  Let UIImage convert it
        let image = UIImage(data: photo.imageData)
        //
        cell.photoImageView.image = image
        cell.photoTitleLabel.text = photo.title
        
        return cell
    }
    
    private func setupCollectionViewLayout() {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { fatalError("Unable to retrieve layout")}
        
        let inset: CGFloat = 12
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        let dimension = (collectionView.bounds.width - 36) / 2
        layout.itemSize = CGSize(width: dimension, height: dimension)
       // layout.headerReferenceSize = CGSize(width: collectionView.bounds.width, height: 64)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
