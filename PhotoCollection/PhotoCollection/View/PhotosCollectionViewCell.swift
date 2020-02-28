//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Shawn James on 2/27/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    // MARK: - Methods
    func updateViews() {
        guard let photo = photo, let image = UIImage(data: photo.imageData) else { return }
        imageView.image = image
        label.text = photo.title
    }
}
