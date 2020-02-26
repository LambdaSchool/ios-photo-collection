//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Karen Rodriguez on 2/26/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import Foundation

class PhotoController {
    var photos = [Photo]()
    
    // MARK: - Methods
    func create(data: Data, title: String) {
        let newPhoto = Photo(imageData: data, title: title)
        self.photos.append(newPhoto)
    }
    
    func update(photo: Photo, data: Data, title: String) {
        
    }
}
