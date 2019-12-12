//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by David Wright on 12/12/19.
//  Copyright © 2019 David Wright. All rights reserved.
//

import Foundation

class PhotoController {
    
    // MARK: Properties
    
    var photos: [Photo] = []
    
    // MARK: Methods

    func createPhoto(from imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func updatePhoto(photo: Photo, newImageData: Data? = nil, newTitle: String? = nil) {
        var updatedPhoto = photo
        
        if let imageData = newImageData {
            updatedPhoto.imageData = imageData
        }
        
        if let title = newTitle {
            updatedPhoto.title = title
        }
    }
}
