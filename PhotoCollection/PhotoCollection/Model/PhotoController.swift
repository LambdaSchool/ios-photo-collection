//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Rick Wolter on 9/13/18.
//  Copyright © 2018 RNWolter. All rights reserved.
//

import Foundation

class PhotoController {
    
    private(set) var photos = [Photo]()
    
    
    
    
    func createPhoto( imageData: Data, title: String) {
        
        let photo = Photo(imageData: imageData, title: title)
        photos.append( photo)
        
    }
    
    func updatePhoto(photo: Photo, imageData: Data, title: String)
    {
        guard let index = photos.index(of: photo) else {return}
        photos[index].imageData = imageData
        photos[index].title = title
        
        
    }
    
}
