//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Lambda_School_Loaner_204 on 10/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class PhotoController {
    
    // MARK: - Properties
    
    var photos = [Photo]()
    
    
    // MARK: - Class Functions
    
    func createPhoto(_ imageData: Data, _ imageTitle: String) {
        let photo = Photo(imageData: imageData, title: imageTitle)
        photos.append(photo)
    }
    
    func updatePhoto(for photo: Photo, updatedData imageData: Data, updatedTitle imageTitle: String) {
        if let photoIndex = photos.firstIndex(of: photo) {
            photos[photoIndex].imageData = imageData
            photos[photoIndex].title = imageTitle
        }
    }
}
