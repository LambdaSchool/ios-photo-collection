//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Mark Gerrior on 2/27/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import Foundation

class PhotoController {
    var photos = [Photo]()
    
    func create(pic: Photo) {
        photos.append(pic)

        // FIXME: Save
        print("Save")
    }

    func create(title: String, image: Data ) {
        let pic = Photo(imageData: image, title: title)
        
        photos.append(pic)

        // FIXME: Save
        print("Save")
    }
    
    func update(pic: Photo, title: String, image: Data) {
        var somethingChanged = false
        
        if let index = photos.firstIndex(where: { $0 == pic }) {
            if (photos[index].title != title) {
                photos[index].title = title
                somethingChanged = true
            }
            if (photos[index].imageData != image) {
                photos[index].imageData = image
                somethingChanged = true
            }
        }
        
        if somethingChanged {
            // FIXME: Save
            print("Save")
        }
    }
}
