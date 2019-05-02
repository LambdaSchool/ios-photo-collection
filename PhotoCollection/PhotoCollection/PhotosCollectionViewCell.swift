//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Mitchell Budge on 5/2/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let myPhoto = photo else { return }
        //photoView.image = myPhoto.imageData       Problem
        photoLabel.text = myPhoto.title
    
    }
    
    
    
    
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
}
