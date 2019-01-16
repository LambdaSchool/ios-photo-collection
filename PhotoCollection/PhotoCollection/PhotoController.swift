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
    
    func create(image: Data, imageTitle: String) {
        let photo = Photo(imageData: image, title: imageTitle)
        photos.append(photo)
    }
    
    func update(photo: Photo, image: Data, imageTitle: String) {
        guard let index = photos.index(of: photo) else { return }
        photos[index].imageData = image
        photos[index].title = imageTitle
        
    }
    
}
