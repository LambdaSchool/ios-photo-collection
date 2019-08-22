//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by William Chen on 8/22/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionCell {
    @IBOutlet weak var imageOutlet: UIImageView!
    
    @IBOutlet weak var imageLabel: UILabel!
    var photo: Photo?{
    didSet{
        updateViews()
    
    }
    }
    private func updateViews(){
        guard let photo = photo else {return}
        
        imageOutlet.image = UIImage(data: photo.imageData)
        imageLabel.text = photo.title
    }

}
