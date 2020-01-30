//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Chris Gonzales on 1/30/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    var photo: Photo?{
        didSet{
            updateViews()
        }
    }
    
    func updateViews(){
        guard let photo = photo else {return}
        photoView.image = UIImage(data: photo.imgageDate)
        photoLabel.text = photo.title
    }
    
    
}
