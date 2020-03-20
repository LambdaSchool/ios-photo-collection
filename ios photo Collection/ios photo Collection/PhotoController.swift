//
//  PhotoController.swift
//  ios photo Collection
//
//  Created by Nicolas Rios on 8/15/19.
//  Copyright © 2019 Nicolas Rios. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func create(_ image: Data,_ title: String) {
        let photo = Photo(imageData: image, title: title)
        photos.append(photo)
    }
    
    func update(_ photo: Photo,_ image: Data,_ title: String) {
        
    }
}
