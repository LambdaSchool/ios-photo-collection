//
//  PhotoCell.swift
//  PhotoCollection
//
//  Created by Jeffrey Santana on 7/25/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let photo = photo  else { return }
        photoImage.image = UIImage(data: photo.imageData)
        photoLabel.text = photo.title
    }
    
    
    
}
