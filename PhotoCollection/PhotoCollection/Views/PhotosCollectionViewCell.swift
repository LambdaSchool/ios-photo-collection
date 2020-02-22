//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Chris Price on 2/21/20.
//  Copyright © 2020 Chris Price. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var photoTitleLabel: UILabel!
    
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let photo = photo else {return}
        photoImageView.image = UIImage(data: photo.imageData)
        photoTitleLabel.text = photo.title
    }
    
}
