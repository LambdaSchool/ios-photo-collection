//
//  PhotoController.swift
//  Photos Collection
//
//  Created by Drew Miller on 5/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

var photos: [Photo] = []

func create(photo: Photo) {
    photos.append(photo)
}

func update(photo: Photo, imageData: Data, title: String) {
    for photo in photos {
        if let index = photos.firstIndex(of: photo) { return }
        
            
        }
    }
