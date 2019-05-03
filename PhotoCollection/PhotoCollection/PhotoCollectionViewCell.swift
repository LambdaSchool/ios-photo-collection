//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Christopher Aronson on 5/2/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    var photo: Photo? {
        didSet {
            print("DidSet")
            updateViews()
        }
    }

    
    func updateViews() {
        guard let photo = photo else {return}
        
        imageView.image = UIImage(data: photo.imageData)
        imageLabel.text = photo.title
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
}
