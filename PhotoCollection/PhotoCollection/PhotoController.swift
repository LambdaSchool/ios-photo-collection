//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Mitchell Budge on 5/2/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func createPhoto(imageData: Data, title: String) {
        var newPhoto = Photo(imageData: imageData, title: title)
        photos.append(newPhoto)
    }
    
    func updatePhoto(photo: Photo, imageData: Data, title: String) {
         var updatedPhoto = photo
        updatedPhoto.imageData = imageData
        updatedPhoto.title = title
    }
}
