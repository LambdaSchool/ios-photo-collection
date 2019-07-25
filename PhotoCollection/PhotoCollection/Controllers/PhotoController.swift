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
    
    func create(photo: Photo) {
        photos.append(photo)
    }
    
    func update(photo: Photo, data: Data, title: String) {
        
    }
    
}


