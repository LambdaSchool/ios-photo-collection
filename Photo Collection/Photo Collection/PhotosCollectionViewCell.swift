//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Cameron Dunn on 1/16/19.
//  Copyright © 2019 Cameron Dunn. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var photo: Photo?{
        didSet{
            updateViews()
        }
    }
    func updateViews(){
        imageView.image = photo!.image
        label.text = photo?.title
    }
    
}
