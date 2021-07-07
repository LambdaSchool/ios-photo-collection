//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Ryan Murphy on 5/9/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import Foundation


class PhotoController {
    var photos: [Photo] = []
    
    func createPhoto(title: String, image: Data) {
        let newPhoto = Photo(imageData: image, title: title)
        
        photos.append(newPhoto)
    }
    
    func updatePhoto(photo: Photo, title: String, image: Data) {
        guard let index = photos.firstIndex(of: photo) else {return}
    
        photos[index].title = title
        photos[index].imageData = image
    
    
    }
    
    
    
    
    
    
}
