//
//  PhotoCollectionViewCell.swift
//  photoviewer
//
//  Created by Ian French on 4/30/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageViewLabel: UILabel!
    
    @IBOutlet weak var imageViewImage: UIImageView!
    
    
    var photo: Photo?  {
        didSet {
            updateViews()
        }
    }
    
    
    
    
    
    
    func updateViews() {
        if let imageData = photo?.imageData {
            imageViewImage.image = UIImage(data: imageData)
        }
        imageViewLabel.text = photo?.title
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
