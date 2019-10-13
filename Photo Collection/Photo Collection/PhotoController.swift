//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Alex Thompson on 10/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class PhotoController {
    
    init() {
        loadFromPersistentStore()
    }
    
    var photos: [Photo] = []
    
    var photoListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("photoList.plist")
    }
    
    func createPhoto(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
        saveToPersistentStore()
    }
    
    func updatePhoto(photo: Photo, imageData: Data, title: String) {
        if let index = photos.firstIndex(of: photo) {
            let updatedPhoto = Photo(imageData: imageData, title: title)
            photos[index] = updatedPhoto
        }
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        guard let url = photoListURL else { return }
        let encoder = PropertyListEncoder()
        
        do {
            let photosData = try encoder.encode(photos)
            try photosData.write(to: url)
        } catch {
            print("Error saving photos data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        do {
            guard let url = photoListURL else { return }
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedPhotos = try decoder.decode([Photo].self, from: data)
            photos = decodedPhotos
        } catch {
            print("Error loading photos data: \(error)")
        }
    }
   
}


