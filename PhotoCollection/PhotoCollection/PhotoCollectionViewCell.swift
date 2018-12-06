//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Sameera Leola on 12/6/18.
//  Copyright © 2018 Sameera Leola. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "PhotoCell"
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var photoTitleLabel: UILabel!
}
