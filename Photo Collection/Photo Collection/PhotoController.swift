//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Wyatt Harrell on 2/27/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create(title: String, imageData: Data) {
        let newPhoto = Photo(title: title, imageData: imageData)
        photos.append(newPhoto)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        for i in 0..<photos.count {
            if photos[i] == photo {
                photos[i].title = title
                photos[i].imageData = imageData
            }
        }
    }
}
