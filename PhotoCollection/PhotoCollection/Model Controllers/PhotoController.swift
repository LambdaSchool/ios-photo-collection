//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Cameron Collins on 3/26/20.
//  Copyright © 2020 Cameron Collins. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func createPhoto(myPhoto: Photo) {
        photos.append(myPhoto)
    }
    
    func updatePhoto(myPhoto: Photo, myData: Data, myString: String) {

    }
}
