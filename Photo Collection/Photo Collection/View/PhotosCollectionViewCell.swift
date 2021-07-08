//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Dillon McElhinney on 9/6/18.
//  Copyright © 2018 Dillon McElhinney. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Private Utility Functions
    private func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        
        photoImageView.image = UIImage(data: photo.imageData)
        titleLabel.text = photo.title
    }
    
    private func setTheme() {
        guard themeHelper?.themePreference != nil else { return }
        
        titleLabel.textColor = ThemeHelper.bodyTextColor
    }
    
}
