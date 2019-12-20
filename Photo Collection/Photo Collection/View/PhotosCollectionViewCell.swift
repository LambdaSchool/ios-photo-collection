//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Kenny on 12/19/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    //MARK: Class properties
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: Helper Methods
    func updateViews() {
        
    }
}
