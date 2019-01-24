//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Stuart on 1/23/19.
//  Copyright © 2019 Stuart. All rights reserved.
//

import UIKit

class PhotoController {
    
    func createPhoto(with imageData: UIImage, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func update(_ photo: Photo, newImageData: UIImage, newTitle: String) {
        guard let index = photos.index(of: photo) else { return }
        var updatePhoto = photo
        
        updatePhoto.imageData = newImageData
        updatePhoto.title = newTitle
        
        photos[index] = updatePhoto
    }
    
    private(set) var photos: [Photo] = [
    Photo(title: "programmer", imageData: "programmer")
    ]
}
