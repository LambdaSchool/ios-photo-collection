//
//  PhotosCollectionViewCell.swift
//  photoCollection
//
//  Created by Jonalynn Masters on 9/19/19.
//  Copyright © 2019 Jonalynn Masters. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    

    //MARK: Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    //Methods:
    var photo: Photo? {
                   didSet {
                       updateViews()
                   }
                }       
            
    private func updateViews() {
        guard let photo = photo else { return }
        imageView.image = photo.imageData
        textLabel.text = photo.title
                    }
       
}
    

