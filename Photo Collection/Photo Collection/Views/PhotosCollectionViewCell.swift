//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by macbook on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    
    
    
    
    //MARK: - Outlets
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    func updateViews() {
        
        guard let photo = photo else { return }
        
        let image = UIImage(data: photo.imageData)
        textLabel.text = photo.title
        imageView.image = image
        
    }
    
    
    
}
