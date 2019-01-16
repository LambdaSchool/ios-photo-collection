//
//  PhotoController.swift
//  iOS-Photo-Collection
//
//  Created by Vijay Das on 1/16/19.
//  Copyright © 2019 Vijay Das. All rights reserved.
//

import Foundation
import UIKit

class PhotoController {
    
    var photos: [Photo] = []
    
    func createPhoto(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
        
    }
    
    func updatePhoto(photo: Photo, imageData: Data, title: String) {
        var photo = photo
        photo.imageData = imageData
        photo.title = title
        
        
    }
}
