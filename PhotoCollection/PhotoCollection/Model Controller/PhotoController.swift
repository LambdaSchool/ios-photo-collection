//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Joshua Rutkowski on 12/12/19.
//  Copyright © 2019 Joshua Rutkowski. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func createPhoto(named title: String, with data: Data) {
        let photo = Photo(title: title, imageData: data)
        photos.append(photo)
    }
    
    func updatePhoto(photo: Photo, named title: String, with data: Data) {
        guard let index = photos.firstIndex(of: Photo) else { return }
        let photo = Photo(title: title, imageData: data)
        photos[index] = photo
        
    }
}
