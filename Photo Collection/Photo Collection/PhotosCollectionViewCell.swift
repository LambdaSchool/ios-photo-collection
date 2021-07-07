//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Moses Robinson on 1/16/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private func updateViews() {
        guard let photoData = photo?.imageData else { return }
        imageView.image = UIImage(data: photoData)
        photoNameLabel.text = photo?.title
    }
    
    //MARK: - Properties
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoNameLabel: UILabel!
}
