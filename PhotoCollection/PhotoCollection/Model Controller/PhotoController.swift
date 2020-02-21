//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Elizabeth Thomas on 2/19/20.
//  Copyright © 2020 Libby Thomas. All rights reserved.
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
