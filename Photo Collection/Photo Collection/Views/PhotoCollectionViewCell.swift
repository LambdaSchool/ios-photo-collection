//
//  PhotoCollectionViewCell.swift
//  Photo Collection
//
//  Created by Cody Morley on 8/3/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    //MARK: - Properties -
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    var theme: String?
    
    
    //MARK: - Methods -
    private func updateViews() {
        guard let photo = photo else { return }
        self.imageView.image = UIImage(data: photo.imageData)
        self.nameLabel.text = photo.title
        
        switch theme {
        case "Dark":
            backgroundColor = UIColor.purple
            nameLabel.textColor = UIColor.white
        case "Lambda":
            backgroundColor = UIColor.red
            nameLabel.textColor = UIColor.white
        default:
            print("No theme info for cell.")
        }
        
    }
}
