//
//  PhotosCollectionViewCell.swift
//  iOS Photo Collection
//
//  Created by Steven Leyva on 7/25/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    var  photo: Photo? {
        didSet {
            updateViews()
        }
    }
    func updateViews() {
        guard let photo = photo else { return }
        let photoData = photo.ImageData
        imageView.image = UIImage(data: photoData)
        photoLabel.text = photo.title
    }
}
