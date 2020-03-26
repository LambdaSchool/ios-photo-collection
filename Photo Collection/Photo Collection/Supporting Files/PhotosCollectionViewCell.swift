//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Joseph Rogers on 10/10/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
   
    
    @IBOutlet weak var photoCellImageView: UIImageView!
    @IBOutlet weak var photoNameLabel: UILabel!
    
    //MARK: Properties
       var photo: Photo? {
           didSet{
               updateViews()
           }
       }
       
       func updateViews() {
           guard let photo = photo else {return}
           
        photoCellImageView.image = UIImage(data: photo.imageData)
        photoNameLabel.text = photo.title
       }
}
