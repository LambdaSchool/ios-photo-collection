//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Dillon McElhinney on 9/6/18.
//  Copyright © 2018 Dillon McElhinney. All rights reserved.
//

import Foundation

class PhotoController {
    
    // MARK: - Properties
    private(set) var photos: [Photo] = []
    
    // MARK: - CRUD Methods
    // Create a new photo and add it to the array
    func createPhoto(title: String, imageData: Data) {
        let photo = Photo(imageData: imageData, title: title)
        
        photos.append(photo)
    }
    
    // Update an existing photo in the array
    func update(photo: Photo, title: String, imageData: Data) {
        guard let index = photos.index(of: photo) else { return }
        
        photos[index].title = title
        photos[index].imageData = imageData
    }
    
    // TODO: - Add Persistence Methods
}
