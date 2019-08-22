//
//  PhotoController.swift
//  PhotoCollection2
//
//  Created by brian vilchez on 8/22/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation
class PhotoController {
    var photos: [Photo] = []
    
    func createPhoto(withTitle title: String , image: Data) {
        let photo = Photo(imageData: image, title: title)
        photos.append(photo)
    }
    
    func updatePhoto(_ photo:Photo, data:Data, title:String ) {
        
    }
}

