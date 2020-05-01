//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Bohdan Tkachenko on 4/30/20.
//  Copyright © 2020 Bohdan Tkachenko. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    func updateViews() {
        
    }
    
}
