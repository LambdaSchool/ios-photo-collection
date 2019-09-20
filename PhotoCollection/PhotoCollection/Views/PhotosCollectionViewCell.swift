//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Gi Pyo Kim on 9/19/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    //MARK: - Properties
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    var photo: Photo? {
        didSet{
            updateViews()
        }
    }
    
    //MARK: - Methods
    private func updateViews() {
        guard let photo = photo else { return }
        
        photoImageView.image = UIImage(data: photo.imageData)
        photoLabel.text = photo.title
    }
}
