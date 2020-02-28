//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Shawn Gee on 2/27/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import Foundation

class PhotoController {
    var photos = [Photo]()
    
    //MARK: - CRUD
    
    func createPhoto(withData data: Data, title: String) {
        photos.append(Photo(imageData: data, title: title))
    }
    
    func update(photo: Photo, withData data: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        photos[index] = Photo(imageData: data, title: title)
    }
}
