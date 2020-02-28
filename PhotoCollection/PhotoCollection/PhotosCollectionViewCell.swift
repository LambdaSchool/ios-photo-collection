//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Lydia Zhang on 2/27/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoTitle: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    func updateViews() {
        guard let photo = photo else {return}
        
        photoTitle.text = photo.title
        photoImage.image = UIImage(data: photo.imageData)
    }
    
}
