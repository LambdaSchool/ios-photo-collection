//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Dojo on 6/13/20.
//  Copyright © 2020 Dojo. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet var photoLabel: UILabel!
    @IBOutlet var photoImageView: UIImageView!
    

    // MARK: - Properties
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }


    // MARK: - Methods
    func updateViews() {
        guard let photo = photo else { return }
        photoLabel.text = photo.title
        photoImageView.image = UIImage(data: photo.imageData)

    }

}
