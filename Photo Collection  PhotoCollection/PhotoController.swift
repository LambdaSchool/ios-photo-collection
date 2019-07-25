//
//  PhotoController.swift
//  Photo Collection  PhotoCollection
//
//  Created by Andrew Ruiz on 7/25/19.
//  Copyright © 2019 Andrew Ruiz. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create() {
        
        #warning("Does this have to be filled out yet?")
        let newPhoto = Photo(imageData: <#T##Data#>, title: <#T##String#>)
        photos.append(newPhoto)
    }
    
    func update(photo: Photo, data: Data, string: String) {}
}
