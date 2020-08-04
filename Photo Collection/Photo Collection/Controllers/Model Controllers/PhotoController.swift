//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Cody Morley on 8/3/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

import Foundation

class PhotoController {
    //MARK: - Properties -
    var photos: [Photo] = []
    
    
    //MARK: - Actions -
    func createPhoto(from data: Data, _ title: String) {
        let newPhoto = Photo(imageData: data,
                             title: title)
        photos.append(newPhoto)
    }
    
    
    //MARK: - Methods -
    func update(_ photo: Photo, with data: Data, and title: String) {
        var storedPhotosIndex: Int = 0
        let updatedPhoto = Photo(imageData: data, title: title)
        
        for storedPhoto in photos {
            if storedPhoto == photo {
                photos.remove(at: storedPhotosIndex)
                storedPhotosIndex += 1
            } else {
                storedPhotosIndex += 1
            }
        }
        photos.append(updatedPhoto)
    }
}
