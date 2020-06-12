//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Norlan Tibanear on 6/11/20.
//  Copyright © 2020 Norlan Tibanear. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    // Outlets
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    
    var photo: Photo? {
        didSet{
            updateView()
        }
    }
    
    func updateView() {
        guard let photo = photo else { return }
        
        titleLabel.text = photo.title
        imageView.image = UIImage(data: photo.imageData)
    }
    
} // END
