//
//  PhotoController.swift
//  PhotoIOSPT5
//
//  Created by David Williams on 2/19/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
   func createPhoto(with title: String, imageData: Data) {
        print("Hey there")
       let  photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
   
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        guard let item = photos.firstIndex(of: photo) else { return }
        var scratch = photo
        scratch.imageData = imageData
        scratch.title = title
        photos.remove(at: item)
        photos.insert(scratch, at: item)
    }
}
