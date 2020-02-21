//
//  PhotosCollectionViewCell.swift
//  PhotoIOSPT5
//
//  Created by David Williams on 2/19/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo?  {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        if UserDefaults.standard.string(forKey: .themePreferenceDark) != nil {
            backgroundColor = .darkGray
        } else if UserDefaults.standard.string(forKey: .themePreferenceGreen) != nil {
            backgroundColor = .systemGreen
        }
        guard let photo = photo else { return }
        photoImage.image =  UIImage(data: photo.imageData)
    }
    
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoTitleLabel: UILabel!
    
}
