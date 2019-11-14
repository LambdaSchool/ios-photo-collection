//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Donella Barcelo on 11/14/19.
//  Copyright © 2019 Donella Barcelo. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photosImageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        
        photoLabel.text = photo.title
        photosImageView.image = UIImage(data: photo.imageData)
    }
}
