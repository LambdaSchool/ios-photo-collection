//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Josh Kocsis on 4/30/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoCollectionImage: UIImageView!
    @IBOutlet weak var photoCollectionLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let photo = self.photo else { return }
        photoCollectionImage.image = UIImage(data: photo.imageData)
        photoCollectionLabel.text = photo.title
    }
}
