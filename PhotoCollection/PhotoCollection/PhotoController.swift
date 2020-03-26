//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Nihal Erdal on 3/24/20.
//  Copyright © 2020 Nihal Erdal. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos : [Photo] = []
    
    func creatPhoto(imageData : Data, title: String){
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func updatePhoto(photo: Photo, imageData: Data, title: String){
        
        guard  let index = photos.firstIndex(of: photo) else {return}
        
        photos[index] = Photo(imageData: imageData, title: title)
    }
}
