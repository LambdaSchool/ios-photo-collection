//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Jeffrey Carpenter on 5/2/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    
    
    func updateViews(){
        guard let photo = photo else { return }
        
        photoImageView.image = UIImage(data: photo.imageData)
        photoLabel.text = photo.title
    }
    
    
    
}
