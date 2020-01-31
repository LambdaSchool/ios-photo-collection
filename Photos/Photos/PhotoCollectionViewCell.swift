//
//  PhotoCollectionViewCell.swift
//  Photos
//
//  Created by scott harris on 1/30/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        if let photo = photo {
            photoImageView.image = UIImage(data: photo.imageData)
            titleLabel.text = photo.title
        }
        
        
        
    }
    
}
