//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Jocelyn Stuart on 1/16/19.
//  Copyright © 2019 JS. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func create(imageContainer: Data, imageTitle: String) {
        let photo = Photo(imageData: imageContainer, title: imageTitle)
        photos.append(photo)
    }
    
    func update(photo: Photo, imageContainer: Data, imageTitle: String) {
        guard let index = photos.index(of: photo) else { return }
        photos[index].imageData = imageContainer
        photos[index].title = imageTitle
        
    }
    
}
