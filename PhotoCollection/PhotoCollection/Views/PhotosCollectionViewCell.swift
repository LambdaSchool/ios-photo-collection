//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Karen Rodriguez on 2/26/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Methods
    
    func updateViews() {
        guard let photo = self.photo else { return }
        
        self.titleLabel.text = photo.title
        self.imageView.image = UIImage(data: photo.imageData)
    }
    
}
