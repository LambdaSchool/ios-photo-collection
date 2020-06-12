//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Gladymir Philippe on 6/11/20.
//  Copyright © 2020 Gladymir Philippe. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var photoLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    func updateViews() {
      guard let photo = photo else { return }
        let image = UIImage(data: photo.imageData)
        photoImageView.image = image
        photoLabel.text = photo.title
    }
}
