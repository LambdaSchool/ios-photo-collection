//
//  PhotoController.swift
//  photoviewer
//
//  Created by Ian French on 4/30/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import Foundation




class PhotoController {
    var photos: [Photo] = []
    
    
    func createPhoto(imageData: Data, title: String ) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    
    }
    
    
    func updatePhoto(for photo: Photo, with imageData: Data, and title: String) {
        if let index = photos.firstIndex(of: photo) {
             
               let updatePhoto = Photo(imageData: imageData, title: title)
            photos[index] = updatePhoto
              }
    
    }



}
