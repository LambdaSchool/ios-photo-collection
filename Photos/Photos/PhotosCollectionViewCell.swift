//
//  PhotosCollectionViewCell.swift
//  Photos
//
//  Created by Victor  on 5/2/19.
//  Copyright © 2019 com.Victor. All rights reserved.
//

import Foundation
import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        // needs logic to set photoimageview and imagetitle
        
    }
    
    
}
