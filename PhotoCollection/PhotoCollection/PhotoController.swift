//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Dennis on 9/19/19.
//  Copyright © 2019 LambdaSchool. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    func update(photo: Photo, data: Data, string: String) {
        
    }
}
