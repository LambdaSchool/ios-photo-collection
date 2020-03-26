//
//  PhotosCollectionViewCell.swift
//  PhotoProject
//
//  Created by Mark Poggi on 3/26/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

import UIKit



class PhotosCollectionViewCell: UICollectionViewCell {
      var photo: Photo? {
          didSet {
              // any time the planet's value changes run this code.
              updateViews()
          }
      }
      
      func updateViews() {
        
      }
    
}
