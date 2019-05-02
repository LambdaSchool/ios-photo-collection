//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Alex Perse on 5/2/19.
//  Copyright © 2019 Alex Perse. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func createPhoto(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        
        photos.append(photo)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        if let i = photos.firstIndex(of: photo)
        {
            photos[i].imageData = imageData
            photos[i].title = title
        }
    }
}
