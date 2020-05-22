//
//  PhotoController.swift
//  ios-photo-collection
//
//  Created by Bryan Cress on 5/22/20.
//  Copyright © 2020 Bryan Cress. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func Create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func Update(photo: Photo, data: Data, title: String) {
    }
}
