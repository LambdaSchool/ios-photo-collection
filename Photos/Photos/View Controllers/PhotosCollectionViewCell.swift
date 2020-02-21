//
//  PhotosCollectionViewCell.swift
//  Photos
//
//  Created by Breena Greek on 2/20/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    // MARK Properties
    var photo: Photo? {
        didSet {
        updateViews()
        }
    }
    
    func updateViews() {
        photoTextLabel.text = photo?.title
        guard let photo = photo else { return }
        photoImage.image = UIImage(data: photo.imageData)
    }
    
    // MARK IBOutlets
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoTextLabel: UILabel!
    
}
