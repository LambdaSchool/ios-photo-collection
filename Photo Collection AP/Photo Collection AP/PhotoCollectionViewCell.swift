//
//  PhotoCollectionViewCell.swift
//  Photo Collection AP
//
//  Created by Jorge Alvarez on 12/19/19.
//  Copyright © 2019 Jorge Alvarez. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
        nameLabel.text = photo?.title
        guard let imageData = photo?.imageData else {return}
        imageView.image = UIImage(data: imageData)
        // This line and extension could work too
        //imageView.image = photo?.imageData.uiImage // ?
    }
    
}

//extension Data {
//    var uiImage: UIImage? {
//        return UIImage(data: self)
//    }
//}
