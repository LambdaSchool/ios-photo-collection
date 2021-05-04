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
        guard let photoIndex = photos.firstIndex(of: photo) else { return }
        
        if let imageData = newImageData {
            photos[photoIndex].imageData = imageData
        }
        
        if let title = newTitle {
            photos[photoIndex].title = title
        }
    }
}
