//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Kelson Hartle on 4/23/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import Foundation


class PhotoController {
    
    var photos: [Photo] = []
    
    func createPhoto(imageData: Data , title: String) {

        let photo = Photo(imageData: imageData, title: title)
        
        photos.append(photo)

    }
    
    func updatePhoto(Photo: Photo, Data: Data, string: String) {
        
        
    }
    
}
