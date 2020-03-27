//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Chris Dobek on 3/26/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    
    func createPhoto(title: String, imageData: Data) {
        let photo = Photo(title: title, imageData: imageData)
        photos.append(photo)
    }
    
    func update(photo: Photo, data: Data, title: String) {
           guard let photoIndex = photos.firstIndex(of: photo) else { return }
           photos.remove(at: photoIndex)
        photos.insert(Photo(title: title, imageData: data), at: photoIndex)
       }
}
