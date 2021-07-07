//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Ryan Murphy on 5/9/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit



class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updatViews()
        }
    }
    func updatViews() {
        guard let photo = photo else {return}
        
        photoImageView.image = UIImage(data: photo.imageData)
        nameLabel.text = photo.title
    }
    
    
    
}
