//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Ry Bautista on 7/25/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var Label: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
        //self.backgroundColor = .red
        guard let photo = photo else { return }
        
        imageView.image = UIImage(data: photo.imageData)
        Label.text = photo.title
        
    }
    
    
}
