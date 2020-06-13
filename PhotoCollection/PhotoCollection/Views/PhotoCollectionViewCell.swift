//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Cora Jacobson on 6/10/20.
//  Copyright © 2020 Cora Jacobson. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        if let photo = photo {
            titleLabel.text = photo.title
            photoImageView.image = UIImage(data: photo.imageData)
        }
    }
    
}
