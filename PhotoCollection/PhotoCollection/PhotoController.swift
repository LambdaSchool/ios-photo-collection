//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Cora Jacobson on 6/10/20.
//  Copyright © 2020 Cora Jacobson. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func createPhoto(_ imageData: Data, _ title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func updatePhoto(_ photo: Photo, _ imageData: Data, _ title: String) {
        if let photoIndex = photos.firstIndex(of: photo) {
            photos[photoIndex].imageData = imageData
            photos[photoIndex].title = title
        }
    }
}

