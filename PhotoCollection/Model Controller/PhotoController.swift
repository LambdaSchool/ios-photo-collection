//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Chris Gonzales on 1/30/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import Foundation

class PhotoController{
    
    
    // MARK: Properties
    
    var photos = [Photo]()
    
    // MARK: CRUD Methods
    
    func createPhoto(photo: Photo){
        let newPhoto = photo
        photos.append(newPhoto)
    }
    
    func updatePhoto(photo: Photo, data: Data, string: String){
        
    }
    
    
    
}
