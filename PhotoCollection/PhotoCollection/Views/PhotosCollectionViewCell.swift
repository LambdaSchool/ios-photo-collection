//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Joel Groomer on 8/15/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    var themeHelper: ThemeHelper?
    
    func updateViews() {
        guard let photo = photo else { return }
        image.image = UIImage.init(data: photo.imageData)
        title.text = photo.title
    }
    
}
