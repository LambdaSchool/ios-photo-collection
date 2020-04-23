//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Nonye on 4/23/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import UIKit



class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var photo: Photo? {
    didSet {
            updateViews()
        }
    }
    func updateViews() {
}
}
