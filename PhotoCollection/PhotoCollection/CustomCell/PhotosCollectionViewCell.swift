//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Carolyn Lea on 8/2/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var photo: Photo?
    {
        didSet
        {
            updateViews()
        }
    }
    
    private func updateViews()
    {
        guard let photo = photo else {return}
        imageView.image = UIImage(data: photo.imageData)
        titleLabel.text = photo.title
    }
}
