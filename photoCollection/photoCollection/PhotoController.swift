//
//  PhotoController.swift
//  photoCollection
//
//  Created by beth on 1/30/20.
//  Copyright © 2020 elizabeth wingate. All rights reserved.
//

import Foundation

class PhotoController {
    
    //step 3
    var photos: [Photo] = []
    
    //step 4
    func create(data: Data, title: String) {
      let photo = Photo(imageData: data, title: title)
        
        photos.append(photo)
    }
    
    //step 5
    func update(photo: Photo, data: Data, title: String) {
        
    }
}
