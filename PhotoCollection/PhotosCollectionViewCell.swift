//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Dawn Jones on 4/30/20.
//  Copyright © 2020 Dawn Jones. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            self.updateViews()
        }
    }
    
    func updateViews() {
        guard let photo = self.photo else { return }
        
        cellImage.image = UIImage(data: photo.imageData)
        cellLabel.text = photo.title
    }
}
