//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Bradley Diroff on 2/27/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

import UIKit

class PhotoController {
    var photos: [Photo] = []
    
    func create(_ photo: Photo) {
        photos.append(photo)
    }
    
    func update(photo: Photo, aData: Data, aString: String) {
        if let index = photos.firstIndex(where: {$0.title == photo.title}){
            photos[index].title = aString
            photos[index].imageData = aData

        }
    }
    
}
