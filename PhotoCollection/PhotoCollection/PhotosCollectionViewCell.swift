//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Bradley Diroff on 2/27/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var photoLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let newPhoto = photo else {return}
        
        photoImageView?.image = UIImage(data: newPhoto.imageData)
        photoLabel.text = newPhoto.title
    }
    
}
