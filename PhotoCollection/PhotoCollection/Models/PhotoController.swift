//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Joel Groomer on 8/15/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import Foundation

class PhotoController {
    private(set) var photos: [Photo] = []
    
    func create(data: Data, title: String) {
        photos.append(Photo(imageData: data, title: title))
    }
    
    func update(photo: Photo, newData: Data, newTitle: String) {
        guard let p = photos.firstIndex(of: photo) else { return }
        photos[p] = Photo(imageData: newData, title: newTitle)
    }
}
