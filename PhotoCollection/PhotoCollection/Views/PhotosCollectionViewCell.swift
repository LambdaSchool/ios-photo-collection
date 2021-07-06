//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Linh Bouniol on 8/2/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textLabel: UILabel!
    
    func updateViews() {
        guard let photo = photo else { return }
        
        imageView?.image = UIImage(data: photo.imageData)
        textLabel?.text = photo.title
        
    }
}
