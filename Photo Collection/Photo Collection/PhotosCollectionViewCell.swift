//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Harmony Radley on 2/27/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
        guard let photo = photo else { return }
        
        photoImageView.image = UIImage(data: photo.imageData)
        label.text = photo.title
    }
    
    
    
}
