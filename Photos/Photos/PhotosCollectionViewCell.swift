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
    
    //properties
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    //computed property
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    //updates cell
    func updateViews() {
        //checking for photo
        guard let photo = photo else {
            return
        }
        //setting properties
        imageTitle.text = photo.title
        let image = UIImage(data: photo.imageData)
        photoImageView.image = image
    }
    
}
