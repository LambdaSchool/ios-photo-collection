//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Linh Bouniol on 8/2/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import Foundation

class PhotoController {
    
    private var persistentFileURL: URL? {
        let fm = FileManager.default
        
        guard let documentDirectory = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documentDirectory.appendingPathComponent("photoCollection.plist")
    }
    
    var photos: [Photo] = []
    
    init() {
        loadFromPersistentStore()
    }
    
    func createPhoto(withTitle title: String, imageData: Data) {
        let photo = Photo(title: title, imageData: imageData)
        photos.append(photo)
        
        saveToPersistentStore()
    }
    
    func update(photo: Photo, title: String, imageData: Data) {
        guard let index = photos.index(of: photo) else { return }
        
        var photo = photo
        photo.title = title
        photo.imageData = imageData
        
        photos.remove(at: index)
        photos.insert(photo, at: index)
        
        saveToPersistentStore()
    }
    
    // MARK: - Archiving/Unarchiving
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(photos)
            try data.write(to: url)
        } catch {
            NSLog("Error saving photos data \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fm = FileManager.default
        
        do {
            guard let url = persistentFileURL, fm.fileExists(atPath: url.path) else { return}
            
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedPhotos = try decoder.decode([Photo].self, from: data)
            photos = decodedPhotos
        } catch {
            NSLog("Error saving photos data \(error)")
        }
    }
}
