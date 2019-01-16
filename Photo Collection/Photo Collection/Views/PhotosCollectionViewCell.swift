//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Angel Buenrostro on 1/16/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    
    var photo: Photo? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews(){
        guard let photo = photo else { return }
        photoLabel.text = photo.title
        imageView.image = UIImage(photo.imageData)
    }
    
}
