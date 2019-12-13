//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Morgan Smith on 12/12/19.
//  Copyright © 2019 Morgan Smith. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func Create(imageData: Data, title: String) -> [Photo] {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
        return photos
    }
    
    func Update(theImage: Photo, theImageData: Data, theTitle: String ) -> Photo {
        var newImage = theImage
        newImage.imageData = theImageData
        newImage.title = theTitle
        return newImage
    }
}
