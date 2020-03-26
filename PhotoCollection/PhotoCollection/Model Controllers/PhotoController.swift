//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Hunter Oppel on 3/26/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import Foundation


class PhotoController {
    
    // MARK: Properties
    
    var photos: [Photo] = []
    
    // MARK: - CRUD
    
    func createPhoto(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        
        photos.append(photo)
    }
    
    func updatePhoto(photo: Photo, imageData: Data, title: String) {
        
    }
}
