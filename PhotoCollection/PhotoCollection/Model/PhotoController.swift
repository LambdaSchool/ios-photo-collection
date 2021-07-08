//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Gerardo Hernandez on 12/12/19.
//  Copyright © 2019 Gerardo Hernandez. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func createPhoto(title: String, imageData: Data) {
        let photo = Photo(title: title, imageData: imageData)
        photos.append(photo)
    
    }
    
    
   func update(photo: Photo, data: Data, title: String) {
    
    guard let index = photos.firstIndex(of: photo) else { return }
    
    let photo = Photo(title: title, imageData: data)
    photos[index] = photo
    
  
    
    }
}






