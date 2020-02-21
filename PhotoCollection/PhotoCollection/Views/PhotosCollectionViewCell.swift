//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Rob Vance on 2/20/20.
//  Copyright © 2020 Rob Vance. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    // Mark: IBOutlets
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoNameLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    func updateViews() {
        guard let photo = photo else { return }
        photoImageView.image = UIImage(data: photo.imageData)
        photoNameLabel.text = photo.title
    }
}
