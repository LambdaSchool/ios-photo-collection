//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Rick Wolter on 10/17/19.
//  Copyright © 2019 Richar Wolter. All rights reserved.
//

import Foundation

class PhotoController{
    
    
    var photos: [Photo] = []
    
    
    
    func create(usingThisData image: Data, andNameIt title: String){
        let newPhoto = Photo(image: image, title: title)
    
    func update(thisPhoto photo: Photo, usingThisData data: Data){
        guard let index = photos.firstIndex(of: photo) else {return}
        
        var updatedPhoto = photos[index]
        updatedPhoto.image = image
        updatedPhoto.title = title    }
    }
    
}
