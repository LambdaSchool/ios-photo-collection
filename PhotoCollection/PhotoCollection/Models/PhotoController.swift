//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Uptiie on 8/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func createPhoto(photo: Photo) {
        let newPhoto = Photo(imageData: photo.imageData, title: photo.title)
        photos.append(newPhoto)
    }
    
    func updatePhoto(photo: Photo, data: Data, title: String) {
        
    }
}
