//
//  PhotoCollectionViewCell.swift
//  Photo Collection
//
//  Created by Lambda_School_Loaner_259 on 2/27/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet var photoLabel: UILabel!
    @IBOutlet var photoImageView: UIImageView!
    
    
    // MARK: - Properties
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    
    // MARK: - Methods
    func updateViews() {
        guard let photo = photo else { return }
        photoLabel.text = photo.name
        photoImageView.image = UIImage(data: photo.imageData)
        
    }
    
}
