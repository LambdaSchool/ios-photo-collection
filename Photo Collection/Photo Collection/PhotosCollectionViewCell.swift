//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Wyatt Harrell on 2/27/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    
    func updateViews() {
        guard let photo = photo else { return }
        
        photoLabel.text = photo.title
        photoImageView.image = UIImage(data: photo.imageData)
    }
    
}
