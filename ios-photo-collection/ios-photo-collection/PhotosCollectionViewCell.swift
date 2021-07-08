//
//  PhotosCollectionViewCell.swift
//  ios-photo-collection
//
//  Created by Benjamin Hakes on 11/28/18.
//  Copyright © 2018 Benjamin Hakes. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo?{
        didSet {
            updateViews()
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
        func updateViews(){
            self.reloadInputViews()
    }
}
