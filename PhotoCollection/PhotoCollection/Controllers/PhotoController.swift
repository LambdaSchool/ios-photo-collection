//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by admin on 7/25/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos = [Photo]()
    
    func create(data: Data, title: String) {
        let photo = Photo(imageData: data, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, data: Data, title: String) {
        
    }
    
}


