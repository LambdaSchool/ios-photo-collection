//
//  PhotoController.swift
//  ios-photo-collection
//
//  Created by denis cedeno on 10/10/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func create(photo: Photo){
        let photo = Photo(imageData: photo.imageData, title: photo.title)
        photos.append(photo)
    }
    
    func update(photo: Photo, data: Data, string: String){
        guard let index = photos.firstIndex(of: photo) else {return}
        photos[index].imageData = data
        photos[index].title = string
    }
    
}
