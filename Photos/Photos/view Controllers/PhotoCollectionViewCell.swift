//
//  PhotoCollectionViewCell.swift
//  Photos
//
//  Created by Marlon Raskin on 7/25/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {


	// MARK: - Outlets & Properties

	var photo: Photo? {
		didSet {
			updateViews()
		}
	}

	@IBOutlet weak var viewForCell: UIView!
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!




	override func awakeFromNib() {
		super.awakeFromNib()

		viewForCell.layer.cornerRadius = 8
	}


	private func updateViews() {
		guard let photo = photo else { return }
		imageView.image = UIImage(data: photo.imageData)
		titleLabel.text = photo.title
	}

}
