//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Alex Rhodes on 7/25/19.
//  Copyright © 2019 Blake Andrew Price. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    func updateViews() {
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        imageLabel.text = photo.title
    }
    
    
}
