//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Lambda_School_Loaner_259 on 2/19/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        var photo = photo
        photo.imageData = imageData
        photo.title = title
    }
    
}
