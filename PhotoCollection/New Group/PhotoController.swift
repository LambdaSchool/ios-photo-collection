//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Farhan on 9/6/18.
//  Copyright © 2018 Farhan. All rights reserved.
//

import Foundation

class PhotoController {
    
    private(set) var photos: [Photo] = []
    
    func createPhoto (image: Data, title: String){
        let newPhoto = Photo(imageData: image, title: title)
        photos.append(newPhoto)
    }
    
    func updatePhoto (photoToUpdate: Photo, newImage: Data, newTitle: String){
        
        guard let index = photos.index(of: photoToUpdate) else {return}
        
        let newPhoto = Photo(imageData: newImage, title: newTitle)
        
        photos.remove(at: index)
        photos.insert(newPhoto, at: index)
    }
    
    
}
