//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Lisa Sampson on 8/9/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import Foundation

class PhotoController {
    
    func create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.index(of: photo) else { return }
        
        var scratch = photo
        scratch.imageData = imageData
        scratch.title = title
        
        photos.remove(at: index)
        photos.insert(scratch, at: index)
    }
    
    var photos: [Photo] = []
}
