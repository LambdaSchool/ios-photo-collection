//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Richard Gibbs on 5/21/20.
//  Copyright © 2020 Rich Gibbs. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? { didSet {updateViews()}}
    
    
    func updateViews() {
        guard let photo = photo else { return }
        photoLabel?.text = photo.title
        imageView.image = UIImage(data: photo.imageData)
         
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
}
