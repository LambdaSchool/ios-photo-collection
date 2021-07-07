//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Moin Uddin on 9/6/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation


class PhotoController {
    
    func create(title: String, imageData: Data) {
        photos.append(Photo(imageData: imageData, title: title))
    }
    
    func update(photo: Photo, title: String, imageData: Data) {
        guard let index = photos.index(of: photo) else { return }
        var newPhoto = photo
        newPhoto.title = title
        newPhoto.imageData = imageData
        photos.remove(at: index)
        photos.insert(newPhoto, at: index)
    }

    private(set) var photos: [Photo] = []

}
