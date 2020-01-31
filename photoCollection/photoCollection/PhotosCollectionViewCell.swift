//
//  PhotosCollectionViewCell.swift
//  photoCollection
//
//  Created by beth on 1/30/20.
//  Copyright © 2020 elizabeth wingate. All rights reserved.
//

import UIKit

//step4
class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photosImageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    //part 3
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    //part 2
    func updateViews() {
        guard let photo = photo else { return }
        
        photosImageView.image = UIImage(data: photo.imageData)
        photoLabel.text = photo.title
    }
}
