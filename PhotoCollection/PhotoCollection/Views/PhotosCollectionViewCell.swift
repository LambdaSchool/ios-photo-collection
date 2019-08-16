//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by John Kouris on 8/15/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
    }
    
}
