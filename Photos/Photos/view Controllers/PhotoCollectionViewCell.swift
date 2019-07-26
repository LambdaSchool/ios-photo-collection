//
//  PhotoCollectionViewCell.swift
//  Photos
//
//  Created by Marlon Raskin on 7/25/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell, ThemeHelperAccessable {


	// MARK: - Outlets & Properties

	var themeHelper: ThemeHelper?
	var photo: Photo? {
		didSet {
			updateViews()
		}
	}

	@IBOutlet weak var viewForCell: UIView!
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!


	// MARK: - Lifecycle

	override func awakeFromNib() {
		super.awakeFromNib()

		viewForCell.layer.cornerRadius = 8
	}


	// MARK: - Theme Method

	func setTheme() {
		guard let theme = themeHelper?.themePreference else { return }
		switch theme {
		case "Dark":
			viewForCell.backgroundColor = Colors.cellDarkBG
			titleLabel.textColor = Colors.darkBGText
		case "Raspberry Red":
			viewForCell.backgroundColor = Colors.redBGAccent
			titleLabel.textColor = Colors.redBGText
		default:
			()
		}
	}


	// MARK: - Update Views

	private func updateViews() {
		setTheme()
		guard let photo = photo else { return }
		imageView.image = UIImage(data: photo.imageData)
		titleLabel.text = photo.title
	}
}
