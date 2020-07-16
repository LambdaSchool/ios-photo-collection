//
//  PhotoCell.swift
//  PhotoCollect
//
//  Created by Nick Nguyen on 1/30/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

import UIKit

class PhotoCollectionCell: UICollectionViewCell {
  
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var photoImage: UIImageView!
  
  var photo: Photo? {
    didSet {
      updateViews()
    }
  }
  
  func updateViews() {
    guard let photo = photo else { return }
    title.text = photo.title
    photoImage.image = UIImage(data: photo.imageData)
  }
}
