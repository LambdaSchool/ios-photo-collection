//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Chris Price on 12/12/19.
//  Copyright © 2019 Chris Price. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func createPhoto(imageData: Data, title: String) -> Photo {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
        return photo
    }
}
