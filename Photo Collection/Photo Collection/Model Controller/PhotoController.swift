//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Juan M Mariscal on 2/20/20.
//  Copyright © 2020 Juan M Mariscal. All rights reserved.
//

import Foundation
class PhotoController {

    var photos: [Photo] = []

    func createPhoto (newImage: Data, title: String) {
        let newPhoto = Photo(imageData: newImage, title: title)
        photos.append(newPhoto)
    }

    func updatePhoto(image photo: Photo, type data: Data, title string: String) {
    
    }
}
