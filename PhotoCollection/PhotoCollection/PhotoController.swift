//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Jonathan Ferrer on 5/9/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

import Foundation

class PhotoController {

    func update(photo: Photo, imageData: Data, title: String){

    }

    func createPhoto(imageData: Data, title: String) {
        photos.append(Photo(imageData: imageData, title: title))
    }

    var photos: [Photo] = []
}
