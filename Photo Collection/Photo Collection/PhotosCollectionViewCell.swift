//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Alex Thompson on 10/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoNameLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        if let imageData = photo?.imageData {
            imageView.image = UIImage(data: imageData)
        }
        photoNameLabel.text = photo?.title
    }

}
