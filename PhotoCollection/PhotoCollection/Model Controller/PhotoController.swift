//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Linh Bouniol on 8/2/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func createPhoto(withTitle title: String, imageData: Data) {
        let photo = Photo(title: title, imageData: imageData)
        photos.append(photo)
    }
    
    func update(photo: Photo, title: String, imageData: Data) {
        guard let index = photos.index(of: photo) else { return }
        
        var photo = photo
        photo.title = title
        photo.imageData = imageData
        
        photos.remove(at: index)
        photos.insert(photo, at: index)
    }
}
