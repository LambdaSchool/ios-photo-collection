//
//  PhotoController.swift
//  photoCollection
//
//  Created by Sammy Alvarado on 4/30/20.
//  Copyright © 2020 Sammy Alvarado. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
//    init(photos: [Photo]) {
//        self.photos = photos
//    }
    
//    func create(forImage imageData: Data, forPhoto title: String) {
//        let photo = Photo(imageData: imageData, title: title)
//        photos.append(photo)
//    }
    
    func create(withImage imageData: Data, withTitle title: String) {
           let photo = Photo(imageData: imageData, title: title)
           photos.append(photo)
       }
    
    func update(photo: Photo, data: Data, string: String) {
        
    }
}
