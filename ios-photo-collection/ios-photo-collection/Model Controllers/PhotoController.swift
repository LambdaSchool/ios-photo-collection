//
//  PhotoController.swift
//  ios-photo-collection
//
//  Created by Alex Shillingford on 6/13/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create(photo: Photo) {
        photos.append(photo)
    }
    
    func update(photo: Photo, data: Data, string: String) {
        
    }
}
