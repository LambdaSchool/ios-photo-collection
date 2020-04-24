//
//  PhotosCollectionViewCell.swift
//  photo collect
//
//  Created by ronald huston jr on 4/23/20.
//  Copyright © 2020 HenryQuante. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let data = photo?.imageData else { return }
        guard let title = photo?.title else { return }
        self.imageView.image = UIImage(data: data)
        self.nameLabel.text = title
    }
} 
