//
//  PhotosCollectionViewCell.swift
//  ios-photo-collection
//
//  Created by denis cedeno on 10/10/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    
    var photo: Photo?{
        didSet{
            updateViews()
        }
    }
    
    func updateViews(){
        guard let photo = photo else {return}
        imageView.image = UIImage(data: photo.imageData)
        label.text = photo.title
    }
}
