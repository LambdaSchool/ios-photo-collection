//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Shawn James on 3/26/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import Foundation

class PhotoController {
    
    // MARK: - Properties
    
    var photos: [Photo]
    
    
    // MARK: - CRUD Methods
    
    func Create(data: Data, title: String) { photos.append(Photo(imageData: data, title: title)) }
    
    func Update(photo: Photo, data: Data, title: String) {
        guard let photoIndex = photos.firstIndex(of: photo) else { return }
        photos.remove(at: photoIndex)
        photos.insert(Photo(imageData: data, title: title), at: photoIndex)
    }
    
    // FIXME: - Add init
    
}
