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
    
    func updatePhoto(photo: Photo, imageData: Data, title: String){
        let newPhoto = Photo(imageData: imageData, title: title)
        let oldPhoto = Photo(imageData: photo.imageData, title: photo.title)
        guard let photoToUpdate = photos.firstIndex(of: oldPhoto) else { return }
        photos.remove(at: photoToUpdate)
        photos.append(newPhoto)
        
        
        // Photo passing in
        // 1. Find in array
        // 2. Set that photo properties to the arguments that I am passing in
    }
}
