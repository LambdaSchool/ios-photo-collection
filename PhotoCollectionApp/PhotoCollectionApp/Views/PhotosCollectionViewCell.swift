//
//  PhotosCollectionViewCell.swift
//  PhotoCollectionApp
//
//  Created by Nelson Gonzalez on 1/16/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    
    private func updateViews() {
        
        guard let photo = photo else {return}
        let image = UIImage(data: photo.imageData)
        photoImageView.image = image
        descriptionLabel.text = photo.title
        
        
    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
}
