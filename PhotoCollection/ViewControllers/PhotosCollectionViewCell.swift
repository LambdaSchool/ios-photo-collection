//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Farhan on 9/6/18.
//  Copyright © 2018 Farhan. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo?{
        didSet {
            updateViews()
        }
    }
    var themeHelper: ThemeHelper?
    var photoController: PhotoController?
    
    @IBOutlet weak var smallView: UIImageView!
    @IBOutlet weak var smallText: UILabel!
    
    private func updateViews (){
        guard let photo = photo else { return}
        smallView.image = UIImage(data: photo.imageData)
        smallText.text = photo.title
        
    }
    
    
}
