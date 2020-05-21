//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Enrique Gongora on 1/30/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets & Variables
    var photo: Photo?{
        didSet{
            updateViews()
        }
    }
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    //MARK: - Functions
    func updateViews() {
        guard let photo = photo else { return }
        photoImageView.image = UIImage(data: photo.imageData)
        nameLabel.text = photo.title
    }
}
