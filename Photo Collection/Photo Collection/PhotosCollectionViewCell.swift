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
        if let data = photo?.imageData,
            let pic = UIImage(data: data) {
            image.image = pic
        }
        label.text = photo?.title
    }
}
