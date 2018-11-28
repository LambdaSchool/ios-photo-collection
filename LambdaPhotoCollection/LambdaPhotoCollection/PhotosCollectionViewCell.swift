//
//  PhotosCollectionViewCell.swift
//  LambdaPhotoCollection
//
//  Created by Austin Cole on 11/28/18.
//  Copyright © 2018 Austin Cole. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var photo: Photo? {didSet { updateViews()}}
    
    func updateViews() {
        
    }

    
    
    
    
    
}
