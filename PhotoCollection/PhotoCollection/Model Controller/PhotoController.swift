//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Nichole Davidson on 2/27/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func create() {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
        
    }
    
    func updateView(Photo: String, imageData: Data, title: String) {
        
    }
}
