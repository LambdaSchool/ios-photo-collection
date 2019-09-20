//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Gi Pyo Kim on 9/19/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

import Foundation

class PhotoController {
    // MARK: - Properties
    var photos: [Photo] = []
    
    private var photoCollectionURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("PhotoCollection.plist")
    }
    
    
    // MARK: - Methods
    init() {
        loadFromPersistentStore()
    }
    
    
    func create (imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
        saveToPersistentStore()
    }
    
    func update (photo: Photo, imageData: Data, title: String) {
        for i in photos.indices {
            if photos[i] == photo {
                photos[i].imageData = imageData
                photos[i].title = title
                saveToPersistentStore()
            }
        }
    }
    
    func saveToPersistentStore() {
        guard let url = photoCollectionURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let photosData = try encoder.encode(photos)
            try photosData.write(to: url)
        } catch {
            print("Error saving photo collection data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        
        do {
            guard let url = photoCollectionURL, fileManager.fileExists(atPath: url.path) else { return }
            let photosData = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedPhotos = try decoder.decode([Photo].self, from: photosData)
            photos = decodedPhotos
            
        } catch {
            print("Error loading photo collection data: \(error)")
        }
    }
    
}
