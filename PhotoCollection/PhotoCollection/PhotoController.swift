//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Thomas Cacciatore on 5/9/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func createPhoto(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        
        photos.append(photo)
    }
    
    func updatePhoto(photo: Photo, imageData: Data, title: String) {
        
    }
}
