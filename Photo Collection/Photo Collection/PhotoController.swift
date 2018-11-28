//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Ivan Caldwell on 11/28/18.
//  Copyright © 2018 Ivan Caldwell. All rights reserved.
//

import Foundation

//Create a class PhotoController
class PhotoController {
    // Add a photos varable of type [Photo], and set its initial value to an empty array.
    var photos: [Photo] = []
    
    // Add a "Create" method that initializes a new instance of Photo and appends it to the photos array.
    func create(_ picture: Photo) {
        photos.append(picture)
    }
    
    
    // Add an "Update" method that takes in Photo,Data, and String parameters.
    func update(photo: Photo, data: Data, string: String) {
        
    }
}
