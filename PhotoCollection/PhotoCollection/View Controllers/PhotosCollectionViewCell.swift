//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Lambda_School_Loaner_259 on 2/20/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: IBOutlets
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var photoLabel: UILabel!
    
    func updateViews() {
        guard let photo = photo else { return }
        photoImageView.image = UIImage(data: photo.imageData)
        photoLabel.text = photo.title
        
    }
}
