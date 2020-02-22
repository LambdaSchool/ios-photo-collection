//
//  PhotoController.swift
//  PhotoIOSPT5
//
//  Created by David Williams on 2/19/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    init() {
        loadFromPersistentStore()
    }
    
    var sortPhotos: [Photo] {
        let sortedPhotos = photos.sorted(by: { $0.title.lowercased() < $1.title.lowercased() })
        return sortedPhotos
    }
    
    var photoListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("photoList.plist")
    }
    
    func saveToPersistentStore() {
        do {
            guard let url = photoListURL else { return }
            let encoder = PropertyListEncoder()
            let photosData = try encoder.encode(photos)
            try photosData.write(to: url)
        } catch {
            print("Error writing to photos data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        do {
            guard let url = photoListURL else { return }
            let moviesData = try Data(contentsOf: url)
            let decodeMovies = PropertyListDecoder()
            photos = try decodeMovies.decode([Photo].self, from: moviesData)
        } catch {
            print("Error loading photos data \(error)")
        }
    }
    
    func createPhoto(with title: String, imageData: Data) {
        let  photo = Photo(title: title, imageData: imageData)
        photos.append(photo)
        saveToPersistentStore()
    }
    
    func update(photo: Photo, imageData: Data? = nil, title: String? = nil) {
        guard let item = photos.firstIndex(of: photo) else { return }
        
        var scratch = photo
        scratch.imageData = imageData!
        scratch.title = title!
        photos.remove(at: item)
        photos.append(scratch)
        saveToPersistentStore()
    }
}
