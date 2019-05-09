//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Jeremy Taylor on 5/9/19.
//  Copyright © 2019 Bytes-Random L.L.C. All rights reserved.
//

import Foundation

class PhotoController {
    private (set) var photos: [Photo] = []
    
    func createPhoto(with imageData: Data, with title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func updatePhoto(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        var tempPhoto = photo
        tempPhoto.imageData = imageData
        tempPhoto.title = title
        
        photos.remove(at: index)
        photos.insert(tempPhoto, at: index)
    }
}
