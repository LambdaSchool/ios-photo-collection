//
//  PhotoController.swift
//  photoCollection
//
//  Created by Jonalynn Masters on 9/19/19.
//  Copyright © 2019 Jonalynn Masters. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []

    
    //MARK: Methods
// "Create" method - initializes a new instance of Photo and eppends it to the photos array
    func createPhoto(imageData: Data, title: String) -> Photo {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
        return photo
    }
// "Update" method - takes in Photo, Data, and String parameters
    func updatePhoto(imageData: Data, title: String, photo: Photo) {
        guard let index = photos.firstIndex(of: photo) else { return }
        var photo = photos[index] // have to define photo variable here since were using it as a parameter
        photo.imageData = imageData
        photo.title = title
    }

    
    
    
}

