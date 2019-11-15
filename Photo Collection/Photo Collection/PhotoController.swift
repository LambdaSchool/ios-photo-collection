//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Donella Barcelo on 11/14/19.
//  Copyright © 2019 Donella Barcelo. All rights reserved.
//

import Foundation

class PhotoController {
    
    init() {
        loadFromPersistentstore()
    }
    
    var photos: [Photo] = []
    
    func createPhoto(data: Data, title: String) {
        let photo = Photo(imageData: data, title: title)
        
        photos.append(photo)
        saveToPersistentStore()
    }
    
    func updatePhoto(photo: Photo, data: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        photos[index] = photo
        saveToPersistentStore()
    }
    
    // MARK: - Privates
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let dir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return dir.appendingPathComponent("Photos.plist")
    }
    
    private func saveToPersistentStore() {
        guard let fileURL = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(photos)
            try data.write(to: fileURL)
        } catch {
            print("Error saving photos data: \(error)")
        }
    }
    
    private func loadFromPersistentstore() {
        let fileManager = FileManager.default
        guard let fileURL = persistentFileURL,
            fileManager.fileExists(atPath: fileURL.path) else { return }
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = PropertyListDecoder()
            photos = try decoder.decode([Photo].self, from: data)
        } catch {
            print("Error loading photos data: \(error)")
        }
    }
}
