//
//  PhotoController.swift
//  Photos
//
//  Created by Victor  on 5/2/19.
//  Copyright © 2019 com.Victor. All rights reserved.
//

import Foundation



class PhotoController {
    
    var photos: [Photo] = []
    
    func create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        //getting the location of each photo
        guard let index = photos.index(of: photo) else {return}
        
        photos[index].imageData = imageData
        photos[index].title = title
    }
    
    
    
    
}
