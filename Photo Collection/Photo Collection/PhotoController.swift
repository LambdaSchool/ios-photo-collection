//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Gladymir Philippe on 6/10/20.
//  Copyright © 2020 Gladymir Philippe. All rights reserved.
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
