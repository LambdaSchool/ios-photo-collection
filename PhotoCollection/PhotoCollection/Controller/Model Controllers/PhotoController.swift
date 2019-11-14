//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Chad Rutherford on 11/14/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import Foundation

/// Model Controller for Photo Objects
class PhotoController {
    var photos = [Photo]()
    
    
    /// Function to create Photo Objects
    /// - Parameters:
    ///   - title: The title for the Photo
    ///   - imageData: The imageData for the Photo
    func create(with title: String, imageData: Data) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    
    /// Function to update existing Photo objects
    /// - Parameters:
    ///   - photo: The photo to be changed
    ///   - title: The title of the Photo
    ///   - imageData: The imageData of the Photo
    func update(photo: Photo, with title: String, imageData: Data) {
        guard let index = photos.firstIndex(of: photo) else { return }
        photos[index].title = title
        photos[index].imageData = imageData
    }
}
