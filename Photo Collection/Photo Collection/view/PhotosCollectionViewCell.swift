//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Vincent Hoang on 4/23/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet var cellImage: UIImageView?
    @IBOutlet var cellTitle: UILabel?
    
    
    var photo: Photo? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        if let unwrappedPhoto = photo?.imageData, let unwrappedTitle = photo?.title {
        
            cellImage?.image = UIImage(data: unwrappedPhoto)
            cellTitle?.text = unwrappedTitle
            
            if ThemeHelper.init().themePreference == "dark" {
                cellTitle?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else if ThemeHelper.init().themePreference == "light" {
                cellTitle?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
        }
    }
}
