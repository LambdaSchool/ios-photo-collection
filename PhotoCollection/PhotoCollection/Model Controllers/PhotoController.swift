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
    
    func updatePhoto(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.index(of: photo) else { return }
        photos[index].imageData = imageData
        photos[index].title = title
        
    }
    
}
