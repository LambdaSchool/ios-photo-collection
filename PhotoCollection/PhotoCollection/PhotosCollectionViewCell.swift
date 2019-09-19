//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Dennis on 9/19/19.
//  Copyright © 2019 LambdaSchool. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let photo = photo else { return }
        
//      imageView.image = photo.image
        imageLabel.text = photo.title
    }
}
