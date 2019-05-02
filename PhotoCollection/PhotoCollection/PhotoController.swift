//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Thomas Cacciatore on 5/2/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func createPhoto(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        
        photos.append(photo)
    }
    
    func updatePhoto(photo: Photo, imageData: Data, title: String) {
        guard let photoIndex = photos.firstIndex(of: photo) else { return }
        
        photos[photoIndex].imageData = imageData
        photos[photoIndex].title = title
        
    }
}
