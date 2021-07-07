//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Moin Uddin on 9/6/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    func updateViews() {
        if let photo = photo {
            photoImageView.image = UIImage(data: photo.imageData)
            titleLabel.text = photo.title
        } else {
            return
        }
    }
    
    
    
    
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var photo : Photo? {
        didSet {
            updateViews()
        }
    }
    
}
