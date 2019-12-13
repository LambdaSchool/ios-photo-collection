//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Joshua Rutkowski on 12/12/19.
//  Copyright © 2019 Joshua Rutkowski. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        photoLabel.text = photo.title
        photoImageView.image = UIImage(data: photo.imageData)
    }
}
