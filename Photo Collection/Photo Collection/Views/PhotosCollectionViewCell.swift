//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Cody Morley on 3/26/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        
        imageView.image = UIImage(data: photo.imageData)
        textLabel.text = photo.title
    }
    
    
    
    
}
