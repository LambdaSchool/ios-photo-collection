//
//  PhotosCollectionViewCell.swift
//  Photo-IOSPT4
//
//  Created by David Williams on 12/12/19.
//  Copyright © 2019 david williams. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo = Photo?{
        didSet {
            updateViews()
        }
    }
    
    
    func updateViews() {
        
    }
    
    
    
}

