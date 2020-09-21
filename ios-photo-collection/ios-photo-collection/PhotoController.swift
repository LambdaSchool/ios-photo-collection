
//  PhotoController.swift
//  ios-photo-collection
//
//  Created by user162867 on 12/19/19.
//  Copyright © 2019 user162867. All rights reserved.
//

import Foundation

class PhotoController {
    var photos : [Photo] = []
    
    func create(imageData: Data, title: String) {
        var newPhoto = Photo(imageData: imageData, title: title)
        photos.append(newPhoto)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        photos[index].imageData = imageData
        photos[index].title = title
    }
}
