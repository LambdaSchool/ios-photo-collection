//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Scott Bennett on 9/13/18.
//  Copyright © 2018 Scott Bennett. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    
    // Create
    func create(withName title: String, imagedata: Data ) {
        let photo = Photo(title: title, imageData: imagedata)
        photos.append(photo)
    }
    
    // Update
    func update(with photo: Photo, title: String, imageData: Data) {
        guard let index = photos.index(of: photo) else { return }
        let newPhoto = Photo(title: title, imageData: imageData)
        photos.remove(at: index)
        photos.insert(newPhoto, at: index)
    }
    
}
