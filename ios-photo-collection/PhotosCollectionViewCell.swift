//
//  PhotosCollectionViewCell.swift
//  ios-photo-collection
//
//  Created by Taylor Lyles on 5/2/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
	
	var photo: Photo? {
		didSet {
			updateViews()
		}
	}
	
	func updateViews() {
		guard let photo = photo else { return }
		
		let image = UIImage(data: photo.imageData)
		imageView.image = image
		label.text = photo.title
	}
	
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var label: UILabel!
}
