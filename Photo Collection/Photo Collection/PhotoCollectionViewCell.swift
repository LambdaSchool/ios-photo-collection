//
//  PhotoCollectionViewCell.swift
//  Photo Collection
//
//  Created by Daniela Parra on 9/6/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    private func updateViews() {
        guard let photo = photo else { return }
        
        let image = UIImage(data: photo.imageData)
        photoImageView.image = image
        photoLabel.text = photo.title
    }
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
}
