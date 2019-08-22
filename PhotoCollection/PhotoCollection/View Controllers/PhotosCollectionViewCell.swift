//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Jordan Christensen on 8/23/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellPhoto: UIImageView!
    @IBOutlet weak var photoNameLabel: UILabel!
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        
        cellPhoto.image = photo.data
        photoNameLabel.text = photo.title
    }
    
}
