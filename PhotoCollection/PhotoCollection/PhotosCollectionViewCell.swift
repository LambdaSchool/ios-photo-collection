//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Nihal Erdal on 3/24/20.
//  Copyright © 2020 Nihal Erdal. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var photo: Photo? {
        
        didSet{
            updateViews()
        }
    }
    
    func updateViews(){
        
        guard let imageData = photo?.imageData else {return}
        
        imageView.image = UIImage(data: imageData)
        nameLabel.text = photo?.title
        
    }
    
    
    
}
