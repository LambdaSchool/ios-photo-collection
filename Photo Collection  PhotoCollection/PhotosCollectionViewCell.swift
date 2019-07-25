//
//  PhotosCollectionViewCell.swift
//  Photo Collection  PhotoCollection
//
//  Created by Andrew Ruiz on 7/25/19.
//  Copyright © 2019 Andrew Ruiz. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    // Properties
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        
        photoLabel.text = photo.title
        
        // TODO: Finish up
        // photoImageView.image = photo.imageData
    }
    
}
