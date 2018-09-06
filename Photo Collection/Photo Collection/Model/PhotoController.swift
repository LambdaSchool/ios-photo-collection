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
    
    // MARK: - Initializers
    init() {
        loadFromPersistentStore()
    }
    
    // MARK: - CRUD Methods
    // Create a new photo and add it to the array
    func createPhoto(title: String, imageData: Data) {
        let photo = Photo(imageData: imageData, title: title)
        
        photos.append(photo)
        saveToPersistentStore()
    }
    
    // Update an existing photo in the array
    func update(photo: Photo, title: String, imageData: Data) {
        guard let index = photos.index(of: photo) else { return }
        
        photos[index].title = title
        photos[index].imageData = imageData
        saveToPersistentStore()
    }
    
    // TODO: - Add Persistence Methods
    private func saveToPersistentStore() {
        guard let url = persistentStoreURL else { return }
        let plistEncoder = PropertyListEncoder()
        
        do {
            let photosData = try plistEncoder.encode(photos)
            try photosData.write(to: url)
        } catch {
            NSLog("There was an error saving to persistent store: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        guard let url = persistentStoreURL,
            FileManager.default.fileExists(atPath: url.path) else { return }
        let plistDecoder = PropertyListDecoder()
        
        do {
            let photosData = try Data(contentsOf: url)
            photos = try plistDecoder.decode([Photo].self, from: photosData)
        } catch {
            NSLog("There was an error loading from persistent store: \(error)")
        }
    }
    
    
    private var persistentStoreURL: URL? {
        guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let photosFile = "photos.plist"
        
        return documentsURL.appendingPathComponent(photosFile)
    }
}
