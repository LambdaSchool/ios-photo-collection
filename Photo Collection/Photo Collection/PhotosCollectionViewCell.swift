//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Mitchell Budge on 5/9/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    var photo: Photo? {
        didSet {
        updateViews()
        }
    }

    func updateViews() {
        guard let photo = photo else { return }
        let image = UIImage(data: photo.imageData)
        imageView.image = image
        photoLabel.text = photo.title
    }
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
}
