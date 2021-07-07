//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Alex Perse on 5/2/19.
//  Copyright © 2019 Alex Perse. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    var photo: Photo? {
        didSet {
            // Called after setting a new value
            self.updateViews()
        }
    }
    
    // MARK: - Outlets
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    // MARK: - Methods
    func updateViews() {
        guard let photo = self.photo else { return }
        self.photoImageView.image = UIImage(data: photo.imageData)
        self.titleLabel.text = photo.title
    }
    
    
}
