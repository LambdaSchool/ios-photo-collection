//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Vici Shaweddy on 8/15/19.
//  Copyright © 2019 Vici Shaweddy. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var textLabel: UILabel!

    /// the photo that will be set
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let imageData = photo?.imageData else { return }
        let image = UIImage(data: imageData)
        self.imageView.image = image
        self.textLabel.text = photo?.title
    }
    
    
}
