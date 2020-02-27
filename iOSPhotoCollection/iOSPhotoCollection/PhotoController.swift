//
//  PhotoController.swift
//  iOSPhotoCollection
//
//  Created by Bhawnish Kumar on 2/27/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import Foundation
// So basically we need to take out the photo from the struct so we can do something with it out of the object which means bring it to the reality and make it work in a creative way.
class PhotoController {
    var photos: [Photo] = []
    
    
    func create(with image: Data, title: String) {
        let newPhoto = Photo(image: image, title: title)
        
        photos.append(newPhoto)
        
    }
    func update(photo: Photo, data: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        
        var updatePhoto = photo
        
        updatePhoto.image = data
        updatePhoto.title = title
        
        photos.remove(at: index)
        photos.insert(updatePhoto, at: index)
    }
}



