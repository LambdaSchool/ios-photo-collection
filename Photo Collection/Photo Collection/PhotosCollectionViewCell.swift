//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Isaac Lyons on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
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
        if let imageData = photo?.imageData {
            imageView.image = UIImage(data: imageData)
        }
        textLabel.text = photo?.title
    }
}
