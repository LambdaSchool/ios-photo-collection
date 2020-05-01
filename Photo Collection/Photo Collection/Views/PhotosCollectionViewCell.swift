//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Rob Vance on 4/29/20.
//  Copyright © 2020 Robs Creations. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    // Mark: IBOutlets
    @IBOutlet weak var photoNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
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
