//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Jesse Ruiz on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create() {
        let photo = Photo(imageData: <#T##Data#>, title: <#T##String#>)
        photos.append(photo)
    }
    
    func update(photo: Photo, data: Data, string: String) {}
}
