//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Vici Shaweddy on 8/14/19.
//  Copyright © 2019 Vici Shaweddy. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create(photo: Photo) {
        photos.append(photo)
    }
    
    func update(photo: Photo, data: Data, string: String) {
        
    }
}
