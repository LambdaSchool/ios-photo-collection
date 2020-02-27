//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Lambda_School_Loaner_259 on 2/27/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

class PhotoController {
    // MARK: - Properties
    var photos: [Photo] = []
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("photos.plist")
    }
    
    // MARK: - Persistence
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(photos)
            try data.write(to: url)
        } catch {
            print("Error saving Photos data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else {
            return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            photos = try decoder.decode([Photo].self, from: data)
        } catch {
            print("error loading photos data: \(error)")
        }
    }
    
    // MARK: - CRUD
    
    func createPhoto(name: String, imageData: UIImage) {
        guard let imageData = imageData.pngData() else { return }
        let photo = Photo(name: name, imageData: imageData)
        photos.append(photo)
        saveToPersistentStore()
    }
    
    func updatePhoto(photo: Photo, name: String, imageData: UIImage) {
        guard let imageData = imageData.pngData(),
            let index = photos.firstIndex(of: photo) else { return }
        photos[index].name = name
        photos[index].imageData = imageData
        saveToPersistentStore()
    }
}
