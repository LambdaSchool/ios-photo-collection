//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Shawn James on 2/27/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import Foundation

class PhotoController {
    // MARK: - Properties
    var photos: [Photo] = []
    
    // MARK: - Methods
    func create(imageData: Data, title: String) {
        let newPhoto = Photo(imageData: imageData, title: title)
        photos.append(newPhoto)
    }
    func update(photo: Photo, imageData: Data, title: String) {
        // FIXME: - What is this supposed to do?
    }
}
