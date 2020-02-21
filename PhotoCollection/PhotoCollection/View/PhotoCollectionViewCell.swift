//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Claudia Contreras on 2/20/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var photoTitleLabel: UILabel!
    
    
    //MARK: - Properties
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
    }
    
}
