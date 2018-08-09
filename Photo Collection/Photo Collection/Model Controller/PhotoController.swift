//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Iyin Raphael on 8/9/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation

class PhotoController{
    
    var photos: [Photo] = []
    
    func createPhoto(title: String, imageData: Data){
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func updatePhoto(photo: Photo, imageData: Data, title: String){
        guard let  index = photos.index(of: photo) else {return}
        var scratch = photo
        scratch.imageData = imageData
        scratch.title = title
        
        photos.remove(at: index)
        photos.insert(scratch, at: index)
    }
    
}
