//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Jordan Christensen on 8/23/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import Foundation
import UIKit

class PhotoController {
    var photos: [Photo] = []
    
    func addPhoto(title: String, data: UIImage) {
        let photo = Photo(title: title, data: data)
        photos.append(photo)
    }
    
    func update(from photo: Photo, title: String, data: UIImage) {
        guard let index = photos.firstIndex(of: photo) else { return }
        photos[index] = Photo(title: title, data: data)
    }
}
