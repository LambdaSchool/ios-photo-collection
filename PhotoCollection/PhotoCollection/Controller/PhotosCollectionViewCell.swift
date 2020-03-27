//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Shawn James on 3/26/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    // MARK: - Properties
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    
    // MARK: - Methods
    
    func updateViews() {
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        titleLabel.text = photo.title
    }
}
