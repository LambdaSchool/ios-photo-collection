//
//  PhotoController.swift
//  Photo App
//
//  Created by Jason Hoover on 5/21/20.
//  Copyright © 2020 Jason Hoover. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func addPhoto(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func updatePhoto(photo: [Photo], imageData: Data, title: String){
        let updatedPhoto = photo,
    }
}
