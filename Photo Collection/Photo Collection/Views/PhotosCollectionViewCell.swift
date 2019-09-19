//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Jesse Ruiz on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var photoCellImageView: UIImageView!
    @IBOutlet weak var photoCellLabel: UILabel!
    
    
    // MARK: - Properties
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Methods
    func updateViews() {
        guard let photo = photo else { return }
        let photo1 = UIImage(data: photo.imageData)
        photoCellImageView.image = photo1
        photoCellLabel.text = photo.title
    }
    //photo1.pngData
}
