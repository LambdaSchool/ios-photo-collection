//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Kelson Hartle on 4/23/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    //MARK: - Properties

    var photo: Photo? {
        
        didSet{
            updateViews()
        }
    }
    
    //MARK: - Functions
    func updateViews() {
        
        //imageView.image = photo?.imageData
        nameLabel.text = photo?.title
        
        
        
    }
    
    
    
}
