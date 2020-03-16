//
//  PhotoController.swift
//  ios-photo-collection
//
//  Created by Matthew Martindale on 2/19/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create(title: String, imageData: Data) {
        photos.append(Photo(title: title, imageData: imageData))
        print(photos)
    }
    
    func update(photo: Photo, imageData: Data, title: String?) {
        
        //david's code
        guard let item = photos.firstIndex(of: photo) else { return }
        if let title = title {
            photos[item].title = title
        }
    }
}
