//
//  PhotoController.swift
//  ios-photo-collection
//
//  Created by denis cedeno on 10/10/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import Foundation

class PhotoController{
    var photos: [Photo] = []
    
    func create(){
        let photo = Photo(imageData: <#T##Data#>, title: <#T##String#>)
        photos.append(photo)
    }
    
    func update(photo: Photo, data: Data, string: String){
        
    }
    
}
