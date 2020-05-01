//
//  PhotosCollectionViewCell.swift
//  PhotoCollectionView
//
//  Created by Clayton Watkins on 4/29/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - Properties
    var photo: Photo?{
        didSet{
            updateViews()
        }
    }
    
    //MARK: - LifeCycle
    func updateViews() {
        guard let photo = photo else {return}
        titleLabel.text = photo.title
        imageView.image = UIImage(data: photo.imageData)
    }
}
