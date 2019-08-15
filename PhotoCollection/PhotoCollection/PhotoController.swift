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
    
    private func create(photo: Photo) {
        photos.append(photo)
    }
    
    private func update(photo: Photo, data: Data, string: String) {
        
    }
}
