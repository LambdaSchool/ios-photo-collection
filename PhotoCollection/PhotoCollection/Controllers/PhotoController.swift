//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Gi Pyo Kim on 9/19/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

import Foundation

class PhotoController {
    // MARK: - Properties
    var photos: [Photo] = []
    
    
    // MARK: - Methods
    func create (imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func update (photo: Photo, imageData: Data, title: String) {
        for i in photos.indices {
            if photos[i] == photo {
                photos[i].imageData = imageData
                photos[i].title = title
            }
        }
    }
    
}
