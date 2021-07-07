//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Scott Bennett on 9/13/18.
//  Copyright © 2018 Scott Bennett. All rights reserved.
//

import UIKit
import Photos

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        imageLabel.text = photo.title
        
    }
    
    
    
}
