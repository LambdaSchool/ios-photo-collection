//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Cameron Dunn on 1/16/19.
//  Copyright © 2019 Cameron Dunn. All rights reserved.
//

import Foundation

class PhotoController {
    var photos : [Photo] = []
    func create(){
        var photo : Photo = Photo(imageData: Data(), title: "")
        photos.append(photo)
    }
    func update(photo: Photo, data: Data, string: String){
        
    }
}
