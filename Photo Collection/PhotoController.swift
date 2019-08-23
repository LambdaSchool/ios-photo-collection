//
//  PhotoController.swift
//  Photo Collection
//
//  Created by William Chen on 8/22/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import Foundation


class PhotoController{

 
    var  photos: [Photo] = []
    
    func createPhoto(photo: Photo){
        let newPhoto = Photo(imageData: photo.imageData, title: photo.title)
        photos.append(newPhoto)
    }
    
    func updateSomething(_ photo: Photo, _ data: Data, _ string: String){
        
    }
}
