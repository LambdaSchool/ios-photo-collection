//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Joshua Sharp on 8/22/19.
//  Copyright © 2019 Joshua Sharp. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create (_ title: String, _ imageData: Data) {
        let photo = Photo(title: title, imageData: imageData)
        photos.append(photo)
    }
    
    func update (_ photo: Photo, data: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        photos[index].title = title
        photos[index].imageData = data
    }
}
