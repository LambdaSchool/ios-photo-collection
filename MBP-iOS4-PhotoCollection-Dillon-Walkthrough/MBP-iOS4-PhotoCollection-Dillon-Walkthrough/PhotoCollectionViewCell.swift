//
//  PhotoCollectionViewCell.swift
//  MBP-iOS4-PhotoCollection-Dillon-Walkthrough
//
//  Created by Vijay Das on 12/6/18.
//  Copyright © 2018 Vijay Das. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PhotoCell"
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var photoTitleLable: UILabel!
    
    
}
