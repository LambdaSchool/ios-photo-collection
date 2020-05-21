//
//  iPhotoController.swift
//  iPhotos
//
//  Created by Violet Lavender Love on 5/21/20.
//  Copyright © 2020 Love. All rights reserved.
//

import Foundation

class iPhotoController {
    
    var iPhotos: [iPhoto] = []
    
    func createiPhoto(title: String,  imageData: Data) {
        let newiPhoto = iPhoto(imageData: imageData, title: title)
        
        iPhotos.append(newiPhoto)
    }
}
