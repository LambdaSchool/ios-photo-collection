//
//  PhotosCollectionViewCell.swift
//  iOS-Photo-Collection
//
//  Created by Vijay Das on 1/16/19.
//  Copyright © 2019 Vijay Das. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    var photo: Photo? {
        didSet { updateViews() }
    }
    
    private func updateViews() {
        
        guard let photo = photo else { return }
        let image = UIImage(data: photo.imageData)
        photoView?.image = image
        title.text = photo.title
        
    }
    
    
}
