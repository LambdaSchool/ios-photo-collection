//
//  PhotoController.swift
//  PhotosCollection
//
//  Created by Mike Nichols on 5/21/20.
//  Copyright © 2020 Mike Nichols. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, data: Data, string: String) {
        
        
    }
    
    
    
    
}
