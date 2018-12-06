//
//  PhotoModel.swift
//  PhotoCollection
//
//  Created by Sameera Leola on 12/6/18.
//  Copyright © 2018 Sameera Leola. All rights reserved.
//

import Foundation

class PhotoModel {
    // MARK: - Singleton
    static let shared = PhotoModel()
    private init() {}
    
    // MARK: - Properties
    private var photos: [Photo] = []
    
    var numberOfPhotos : Int {
        return photos.count
    }
    
    // MARK: - CRUD Methods
    func addPhoto(title: String, imageData: Data) {
        let photo = Photo(title: title, imageData: imageData)
        photos.append(photo)
    }
    
    //We need a way to make this equatable
    
    //Remove
    func removePhoto(at indexPath: IndexPath) {
        photos.remove(at: indexPath.item)
    }
    
    func updatePhoto(photo: Photo, title: String, imageData: Data) {
        photo.title = title
        photo.imageData = imageData
    }
    
    //For collections we reference item instead of row
    func photo(at indexPath: IndexPath) -> Photo {
        return photos[indexPath.item]
    }
}
