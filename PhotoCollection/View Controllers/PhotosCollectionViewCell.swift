//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Chad Parker on 2/20/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    var photo: Photo? {
        didSet {
            updateViews()
        }
    }

    private func updateViews() {
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        titleLabel.text = photo.title
    }
}
