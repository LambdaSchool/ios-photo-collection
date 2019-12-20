//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Kenny on 12/19/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//

import Foundation

class PhotoController {
    //MARK: Class properties
    var photos: [Photo] = []
    
    //MARK: Class Methods
    func create(photo: Photo) {
        print("creating photo: ",photo)
        self.photos.append(photo)
        print(photos)
    }
    
    func update(photo: Photo, data: Data, name: String) {
        print("updating image from photoController")
        for (index, thisPhoto) in photos.enumerated() where thisPhoto == photo {
            let newPhoto = Photo(imageData: data, title: name)
            photos[index] = newPhoto
        }
    }
}
