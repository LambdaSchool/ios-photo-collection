//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by David Wright on 12/12/19.
//  Copyright © 2019 David Wright. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    // MARK: Properties

    var photo: Photo? {
        didSet { updateViews() }
    }
    
    // MARK: IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: Methods

    private func updateViews() {
        guard let photo = photo else { return }
        
        imageView.image = UIImage(data: photo.imageData)
        titleLabel.text = photo.title
    }
    
}
