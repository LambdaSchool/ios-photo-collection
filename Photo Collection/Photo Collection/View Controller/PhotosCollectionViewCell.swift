//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Iyin Raphael on 8/9/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet{
            updateViews()
        }
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func updateViews(){
        guard let imageCell = photo else {return}
        imageView.image = UIImage(data: imageCell.imageData)
        label.text = imageCell.title
    }
    
}
