//
//  PhotoCollectionViewCell.swift
//  Photo Collection
//
//  Created by Stuart on 1/23/19.
//  Copyright © 2019 Stuart. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    private func updateViews() {
        guard let title = photo?.title,
              let imageData = photo?.imageData else { return }
        let image = UIImage(data: imageData)
        
        imageLabel.text = title
        imageView.image = image
    }
    
    // MARK: - IBOutlets & Properties
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
}
