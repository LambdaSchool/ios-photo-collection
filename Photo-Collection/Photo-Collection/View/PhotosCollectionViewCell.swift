//
//  PhotosCollectionViewCell.swift
//  Photo-Collection
//
//  Created by Ilgar Ilyasov on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTextLabel: UILabel!
    
    var photo: Photo? {
        didSet { updateViews() }
    }
    
    private func updateViews() {
        guard let title = photo?.title,
              let imageData = photo?.imageData else { return }
              let image = UIImage(data: imageData)
        
        photoTextLabel.text = title
        photoImageView.image = image
    }
    
}
