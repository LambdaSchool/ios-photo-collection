//
//  PhotosCollectionViewCell.swift
//  iOSPhotoCollection
//
//  Created by Bhawnish Kumar on 2/27/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var photoLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    
    //    for the function is in order to update the view from the planets
    func updateViews() {
        guard let photo = photo else { return }
        photoImageView.image = UIImage(data: photo.image)
        photoLabel.text = photo.title
        
    }
}
