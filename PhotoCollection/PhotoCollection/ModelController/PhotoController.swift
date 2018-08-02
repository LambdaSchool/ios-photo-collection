//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Carolyn Lea on 8/2/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import Foundation

class PhotoController
{
    var photos: [Photo] = []
    
    func createPhoto(imageData: Data, title: String)
    {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
        
    }
    
    func updatePhoto(photo: Photo, imageData: Data, title: String)
    {
        if let index = photos.index(of: photo)
        {
            var tempPhoto = photo
            tempPhoto.imageData = imageData
            tempPhoto.title = title
            
            photos.remove(at: index)
            photos.insert(tempPhoto, at: index)
        }
    }
}
