//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Hunter Oppel on 3/26/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Properties
    
    var photo: Photo? {
        didSet{
            updateViews()
        }
    }
    
    // MARK: - View Lifecycle
    
    func updateViews() {
        guard let image = photo?.imageData else {return}
        imageView.image = UIImage(data: image)
        nameLabel.text = photo?.title
    }
}
