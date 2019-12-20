//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Kenny on 12/19/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//

import Foundation

class PhotoController {
    //MARK: Class properties
    var photos: [Photo] = []
    
    //MARK: Class Methods
    func create(photo: Photo) {
        self.photos.append(photo)
    }
    
    func update(photo: Photo, data: Data, name: String) {
        
    }
}
