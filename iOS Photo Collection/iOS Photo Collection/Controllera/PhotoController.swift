//
//  PhotoController.swift
//  iOS Photo Collection
//
//  Created by Jake Connerly on 7/25/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func createPhoto(image: Data, title: String) {
        let newPhoto = Photo(ImageData: image, title: title)
        photos.append(newPhoto)
    }
    
    func update(photo: Photo, image: Data, title: String) {
        
    }
}
