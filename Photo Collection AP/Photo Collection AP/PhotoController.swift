//
//  PhotoController.swift
//  Photo Collection AP
//
//  Created by Jorge Alvarez on 12/19/19.
//  Copyright © 2019 Jorge Alvarez. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func createPhoto(title: String, imageData: Data) {
        photos.append(Photo(imageData: imageData, title: title))
    }
    
    func update(photo: Photo, title: String, data: Data) {
        print("called \(#function)")
    }
    
}
