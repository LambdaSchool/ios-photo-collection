//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Ian Becker on 5/21/20.
//  Copyright © 2020 Ian Becker. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func Create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        
        photos.append(photo)
    }
    
    func Update(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        
        
    }
}


