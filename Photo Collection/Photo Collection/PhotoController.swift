//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Mark Gerrior on 2/27/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import Foundation

class PhotoController {
    var photos = [Photo]()
    
    func create(pic: Photo) {
        photos.append(pic)
    }

    func create(title: String, image: Data ) {
        let pic = Photo(imageData: image, title: title)
        
        photos.append(pic)
    }
    
    func update(pic: Photo, title: String, image: Data) {
        
    }
}
