//
//  PhotoController.swift
//  photo collect
//
//  Created by ronald huston jr on 4/23/20.
//  Copyright © 2020 HenryQuante. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func createPhoto(title: String, imageData: Data) {
        var newPhoto = Photo(title: title, imageData: imageData)
        photos.append(newPhoto)
    }
    func updatePhoto(photo: Photo, imageData: Data, title: String) {
        
    }
}
