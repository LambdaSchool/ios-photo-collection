//
//  PhotoCollectionViewController.swift
//  ios photo Collection
//
//  Created by Nicolas Rios on 9/30/19.
//  Copyright © 2019 Nicolas Rios. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        photoImageView.image = UIImage(data: photo!.imageData)
        photoLabel.text = photo?.title
    }
    
}
