//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Iyin Raphael on 8/9/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
   
    func updateView(){
        if let photo = photo {
            imageView.image = UIImage(data: photo.imageData)
            textLabel.text = photo.title
        }
    }
   
    var photo: Photo?{
        didSet{
            updateView()
        }
    }
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
}
