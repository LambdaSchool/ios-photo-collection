//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Lambda_School_Loaner_204 on 10/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    // MARK: - Properties
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    
    // MARK: - Functions
    
    func updateViews() {
        guard let photo = photo else { return }
        
        imageView.image = UIImage(data: photo.imageData)
        imageLabel.text = photo.title
    }
}
