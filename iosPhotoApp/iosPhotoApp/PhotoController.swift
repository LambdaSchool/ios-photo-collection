//
//  PhotoController.swift
//  iosPhotoApp
//
//  Created by Jarren Campos on 2/20/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

import Foundation


class PhotoController {
    var photo: [Photo] = []
    
    func Create(imageData: Data, title: String) {
        photo.append(Photo(imageDate: imageData, title: title))
        
    }
    
    func Update(photo: Photo, data: Data, string: String){
        
    }
}
