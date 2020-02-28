//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Lydia Zhang on 2/27/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import Foundation
class PhotoController {
    var photos: [Photo] = []
    
    func Create(data: Data, title: String) {
        let photo = Photo(imageData: data, title: title)
        photos.append(photo)
    }
    func update(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else {return}
        photos[index] = Photo(imageData: imageData, title: title)
    }
}
