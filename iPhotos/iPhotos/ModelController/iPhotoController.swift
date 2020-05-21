//
//  iPhotoController.swift
//  iPhotos
//
//  Created by Violet Lavender Love on 5/21/20.
//  Copyright © 2020 Love. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [iPhoto] = []
    
    func addiPhoto(title: String,  imageData: Data) {
        let newiPhoto = iPhoto(imageData: imageData, title: title)
        
        photos.append(newiPhoto)
    }
    
    func updateiPhoto(iPhoto: iPhoto, imageData: Data, title: String) {
        let newiPhoto = iPhoto(addiPhoto(title: title, imageData: imageData)
        let someiPhoto = iPhoto(imageData: iPhoto.imageData, title: iPhoto.title)
        //With photo passed in, first find it in array, set said photo's properties to the properties being passed in
        guard let iPhotoToCreate = iPhotos.index(of: someiPhoto) else { return }
        iPhotos.remove(at: iPhotoToCreate)
        iPhotos.append(iPhotoToCreate)
        
        
    }
}
