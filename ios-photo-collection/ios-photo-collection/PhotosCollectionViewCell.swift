//
//  PhotosCollectionViewCell.swift
//  ios-photo-collection
//
//  Created by user162867 on 12/19/19.
//  Copyright © 2019 user162867. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
    }
    
    
    
}
