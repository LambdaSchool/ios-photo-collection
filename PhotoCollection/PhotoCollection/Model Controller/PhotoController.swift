//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Violet Lavender Love on 4/23/20.
//  Copyright © 2020 Love. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func addPhoto(imageData: Data, title: String) -> Photo {
      
        let photo = Photo(imageData: imageData, title: title)
        
        photos.append(photo)
        
        return photo
    }
}
