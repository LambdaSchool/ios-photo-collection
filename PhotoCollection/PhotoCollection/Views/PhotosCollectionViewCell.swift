//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Ian Becker on 5/21/20.
//  Copyright © 2020 Ian Becker. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    
    var photo: Photo? { didSet { updateViews() } }
    
    func updateViews() {
        guard let photo = photo else { return }
        
        labelView.text = photo.title
    }
    
}
