//
//  PhotoController.swift
//  Photo-Collection
//
//  Created by Ilgar Ilyasov on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class PhotoController {
    
    // MARK: - Properties
    
    private(set) var photos = [Photo]()
    
    // MARK: - CRUD methods
    
    func createPhoto(title: String, imageData: Data) {
        let newPhoto = Photo(title: title, imageData: imageData)
        photos.append(newPhoto)
    }
    
    func updatePhoto(photo: Photo, title: String, imageData: Data) {
        guard let index = photos.index(of: photo) else { return }
        
        photos[index].title = title
        photos[index].imageData = imageData
    }
}
