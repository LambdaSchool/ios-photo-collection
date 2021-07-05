//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Dennis Rudolph on 10/17/19.
//  Copyright © 2019 LambdaSchool. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var photoLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    
    func updateViews() {
        guard let photo = photo else { return }
        photoLabel.text = photo.title
        photoImage.image = UIImage(data: photo.imageData)
    }
}
