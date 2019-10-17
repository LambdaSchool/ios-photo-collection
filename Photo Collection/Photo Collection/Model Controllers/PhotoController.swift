//
//  PhotoController.swift
//  Photo Collection
//
//  Created by morse on 10/17/19.
//  Copyright © 2019 morse. All rights reserved.
//

import Foundation

class PhotoController {
    
    init() {
        loadFromPersistentStore()
    }
    
    var photos: [Photo] = []
    
    func createPhoto(named title: String, with data: Data) {
        let photo = Photo(title: title, imageData: data)
        
        photos.append(photo)
        saveToPersistentStore()
    }
    
    func update(photo: Photo, named title: String, with data: Data) {
        guard let index = photos.firstIndex(of: photo) else { return }
        let photo = Photo(title: title, imageData: data)
        photos[index] = photo
        saveToPersistentStore()
    }
    
    private var persistentFileURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return dir.appendingPathComponent("photos.plist")
    }
    
    private func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(photos)
            try data.write(to: url)
        } catch {
            print("Error saving books data: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = persistentFileURL,
            fm.fileExists(atPath: url.path) else { return }
        
        do{
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            photos = try decoder.decode([Photo].self, from: data)
        } catch {
            print("Error loading books data: \(error)")
        }
    }
}
