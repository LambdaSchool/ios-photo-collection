//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Jonathan Ferrer on 5/9/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    func updateViews() {
        guard let photo = photo else {return}
        photoImageView.image = UIImage(data: photo.imageData)
        photoLabel.text = photo.title
    }


    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }

    
}
