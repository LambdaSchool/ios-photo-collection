//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Donella Barcelo on 11/14/19.
//  Copyright © 2019 Donella Barcelo. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func createPhoto(data: Data, title: String) {
        let photo = Photo(imageData: data, title: title)
        
        photos.append(photo)
    }
    
    func updatePhoto(photo: Photo, data: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        photos[index] = photo
    }
    
}
