//
//  iPhotoController.swift
//  iPhotos
//
//  Created by Violet Lavender Love on 5/21/20.
//  Copyright © 2020 Love. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func addPhoto(title: String,  imageData: Data) {
        let newPhoto = Photo(imageData: imageData, title: title)
        
        photos.append(newPhoto)
    }
    
    func updatePhoto(photo: Photo, imageData: Data, title: String) {
        let newPhoto = Photo(imageData: imageData, title: title)
        let somePhoto = Photo(imageData: photo.imageData, title: photo.title)
        //With photo passed in, first find it in array, set said photo's properties to the properties being passed in
        guard let photoToCreate = photos.index(of: somePhoto) else { return }
        photos.remove(at: photoToCreate)
        photos.append(newPhoto)
        
        
    }
}
