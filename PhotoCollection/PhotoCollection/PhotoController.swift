//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Lambda_School_Loaner_241 on 2/20/20.
//  Copyright © 2020 Lambda_School_Loaner_241. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = [] // giving a variable or constant(let) a initial value = dont need initializer 
    
    func create(photo: Photo) {  // a function inside a classs = methods
        return photos.append(photo)
        
    }
    
    func update(image: Photo, data: Data, string: String) {
        
    }
}
