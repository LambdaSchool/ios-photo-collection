//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Lisa Sampson on 8/9/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    func updateViews() {
        guard let photo = photo else { return }
        photoLabel.text = photo.title
        photoImageView.image = UIImage(data: photo.imageData)
    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
}
