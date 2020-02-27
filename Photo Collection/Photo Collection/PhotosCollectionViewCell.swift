//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Mark Gerrior on 2/27/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func updateViews() {
        if let data = photo?.imageData {
//            image = data // FIXME:
        }
        label.text = photo?.title
    }
}
