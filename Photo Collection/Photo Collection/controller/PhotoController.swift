//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Vincent Hoang on 4/23/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = [Photo]()
    
    func createPhoto(_ imageData: Data,_ title: String) {
        photos.append(Photo(imageData, title))
    }
    
    func updatePhoto(_ photo: Photo, _ imageData: Data, _ title: String) {
        if let photoIndex = photos.firstIndex(of: photo) {
            photos[photoIndex].imageData = imageData
            photos[photoIndex].title = title
        }
    }
    
    
}
