//
//  PhotosCollectionViewCell.swift
//  ios-Photo-Collection
//
//  Created by LambdaSchoolVM_Catalina on 12/12/19.
//  Copyright © 2019 Sal Amer. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        imageLbl.text = photo.title
        
    }
    
    // IB Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageLbl: UILabel!
    
    
}
