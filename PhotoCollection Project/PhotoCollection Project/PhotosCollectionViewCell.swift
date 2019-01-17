//
//  PhotosCollectionViewCell.swift
//  PhotoCollection Project
//
//  Created by Michael Flowers on 1/16/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            updateViews()
            print("passed in photo to cell")
        }
    }
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoTitle: UILabel!
    
    
    func updateViews(){
        guard let passedInPhoto = photo else { return }
        let image = UIImage(data: passedInPhoto.imageData)
        photoImage.image = image
        photoTitle.text = passedInPhoto.title
    }
}
