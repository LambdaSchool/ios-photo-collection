//
//  PhotosCollectionViewCell.swift
//  iosPhotoApp
//
//  Created by Jarren Campos on 2/20/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet var photoInput: UIImageView!
    @IBOutlet var photoLabel: UILabel!
    
    func updateViews() {
//        photoInput.image = photo?.imageDate
        photoLabel.text = photo?.title
        
    }
}
