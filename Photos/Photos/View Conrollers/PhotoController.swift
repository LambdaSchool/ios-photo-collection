//
//  PhotoController.swift
//  Photos
//
//  Created by Breena Greek on 2/19/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []


func create(imageData: Data, title: String) {
    let photo = Photo(imageData: imageData, title: title)
    photos.append(photo)

    func update(photo: Photo, data: Data, string: String) {
    
        }
    }
}
