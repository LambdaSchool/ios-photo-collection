//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Thomas Cacciatore on 5/9/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    
    func updateViews() {
        guard let photoData = photo?.imageData else { return }
        photoImageView.image = UIImage(data: photoData)
        photoLabel.text = photo?.title
    }
    
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
}
