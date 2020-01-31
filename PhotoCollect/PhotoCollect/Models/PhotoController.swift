//
//  PhotoController.swift
//  PhotoCollect
//
//  Created by Nick Nguyen on 1/30/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

import Foundation
class PhotoController {
    
    var photos = [Photo]()
    
    func createPhoto(title:String,image:Data) {
        let newPhoto = Photo(title: title, imageData: image)
        photos.append(newPhoto)
    }
    
    func update(photo: Photo,image:Data,title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        
             var scratch = photo
               
               scratch.imageData = image
               scratch.title = title
               
               photos.remove(at: index)
               photos.insert(scratch, at: index)
    }
    
}
