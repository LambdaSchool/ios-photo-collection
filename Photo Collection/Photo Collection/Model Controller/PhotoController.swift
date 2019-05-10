//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Mitchell Budge on 5/9/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func createPhoto(imageData: Data, title: String) {
        let newPhoto = Photo(imageData: imageData, title: title)
        photos.append(newPhoto)
    } // end of create photo function
    
    func updatePhoto(photo: Photo, imageData: Data, title: String) {
        guard let photoIndex = photos.firstIndex(of: photo) else { return }
        var updatedPhoto = photo
        photos.remove(at: photoIndex)
        
        updatedPhoto.imageData = imageData
        updatedPhoto.title = title
        photos.append(updatedPhoto)
    } // end of update photo function
}
