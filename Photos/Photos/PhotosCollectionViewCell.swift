//
//  PhotosCollectionViewCell.swift
//  Photos
//
//  Created by Victor  on 5/2/19.
//  Copyright © 2019 com.Victor. All rights reserved.
//

import Foundation
import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        // needs logic to set photoimageview and imagetitle
        guard let photo = photo else {
            print("No Photo")
            return
        }
        
        imageTitle.text = photo.title
        let image = UIImage(data: photo.imageData)
        photoImageView.image = image
        print("updated views")
    }
    
    
}
