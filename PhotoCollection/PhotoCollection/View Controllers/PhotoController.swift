//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Vijay Das on 1/24/19.
//  Copyright © 2019 Vijay Das. All rights reserved.
//

import UIKit

class PhotoController {
    
    var photos: [Photo] = []
    
    func createPhoto(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    

    
    
    
}
