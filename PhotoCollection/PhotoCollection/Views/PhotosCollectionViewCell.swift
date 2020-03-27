//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Cameron Collins on 3/26/20.
//  Copyright © 2020 Cameron Collins. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    //Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    //Variables
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    //Functions
    func updateViews() {
        if let myImage = photo?.imageData {
            imageView.image = UIImage(data: myImage)
            labelTitle.text = photo?.title
        }
    }
    
    
}
