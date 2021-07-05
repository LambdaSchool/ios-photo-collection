//
//  PhotoCollectionViewCell.swift
//  PhotoCollection2
//
//  Created by brian vilchez on 8/22/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var PhotoImage: UIImageView!
    @IBOutlet weak var photoNameLabel: UILabel!
    
	var photo: Photo? {
		didSet {
			updateViews()
		}
	}

	func updateViews() {
		guard let photo = photo else { return }
        PhotoImage.image = UIImage(data: photo.imageData)
        photoNameLabel.text = photo.title

	}
}
