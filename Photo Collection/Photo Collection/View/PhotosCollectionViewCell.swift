//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Juan M Mariscal on 2/20/20.
//  Copyright © 2020 Juan M Mariscal. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        photoImageView.image = UIImage(data: photo.imageData)
        photoLabel.text = photo.title
    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var photoLabel: UILabel!
    
}
