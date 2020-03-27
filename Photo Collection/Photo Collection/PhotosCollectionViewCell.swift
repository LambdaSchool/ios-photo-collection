//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Chris Dobek on 3/26/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews(){
        if let photo = photo {
            photoImageView.image = UIImage(data: photo.imageData)
            titleLabel.text = photo.title
        }
    }
}
