//
//  PhotoModel.swift
//  MBP-iOS4-PhotoCollection-Dillon-Walkthrough
//
//  Created by Vijay Das on 12/6/18.
//  Copyright © 2018 Vijay Das. All rights reserved.
//

import Foundation

class PhotoModel {
    static let shared = PhotoModel()
    private init () {}
    // MARK: - Properties
    private var photos: [Photo] = []
    // MARK - CRUD Methods
    
    var numberOfPhotos: Int { return photos.count }
    
    
    // CRUD or MODEL METHODS
    
    func addPhoto(title: String, imageData: Data) {
        let photo = Photo(title: title, imageData: imageData)
        photos.append(photo)
    }
    
    func remove(at indexPath: IndexPath) {
        photos.remove(at: indexPath.row)
    }
    
    func updatePhoto(photo: Photo, title: String, imageData: Data) {
        photo.title = title
        photo.imageData = imageData
    }
    
    func photo(at indexPath: IndexPath) -> Photo {
        return photos[indexPath.row]
    }
}
