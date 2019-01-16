//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Jocelyn Stuart on 1/16/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        
        imageView.image = UIImage(data: photo.imageData) 
        photoLabel.text = photo.title
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var photoLabel: UILabel!
    
    
}
