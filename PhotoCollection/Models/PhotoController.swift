//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Chad Parker on 2/20/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import Foundation

class PhotoController {

    var photos: [Photo] = []

    func create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }

    func update(_ photo: Photo, imageData: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        photos[index].imageData = imageData
        photos[index].title = title
    }
}
