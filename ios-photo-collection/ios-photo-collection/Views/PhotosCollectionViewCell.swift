//
//  PhotosCollectionViewCell.swift
//  ios-photo-collection
//
//  Created by Matthew Martindale on 2/19/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            updateView()
        }
    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    func updateView() {
        if let photo = photo {
        photoImageView.image = UIImage(data: photo.imageData)
        photoLabel.text = photo.title
        }
    }
    
}
