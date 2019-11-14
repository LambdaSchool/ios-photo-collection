//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Chad Rutherford on 11/14/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import Foundation

/// Model Controller for Photo Objects
class PhotoController {
    
    /// Data source for Photo Controller
    var photos = [Photo]()
    
    
    /// Initializes PhotoController woth objects from Plist
    init() {
        loadFromPersistentStore()
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Persistence
    private var persistentFileURL: URL? {
        let fm = FileManager.default
        guard let documentsDirectory = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileName = "Photos.plist"
        return documentsDirectory.appendingPathComponent(fileName)
    }
    
    /// Function to create Photo Objects
    /// - Parameters:
    ///   - title: The title for the Photo
    ///   - imageData: The imageData for the Photo
    func create(with title: String, imageData: Data) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
        saveToPersistentStore()
    }
    
    /// Function to update existing Photo objects
    /// - Parameters:
    ///   - photo: The photo to be changed
    ///   - title: The title of the Photo
    ///   - imageData: The imageData of the Photo
    func update(photo: Photo, with title: String, imageData: Data) {
        guard let index = photos.firstIndex(of: photo) else { return }
        photos[index].title = title
        photos[index].imageData = imageData
        saveToPersistentStore()
    }
    
    /// Function to save Photos to Plist
    private func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        let encoder = PropertyListEncoder()
        do {
            let photosData = try encoder.encode(photos)
            try photosData.write(to: url)
        } catch let saveError {
            print("Error saving photos to file: \(saveError.localizedDescription)")
        }
    }
    
    /// Function to load Photos from Plist
    private func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = persistentFileURL, fm.fileExists(atPath: url.path) else { return }
        let decoder = PropertyListDecoder()
        do {
            let photosData = try Data(contentsOf: url)
            photos = try decoder.decode([Photo].self, from: photosData)
        } catch let loadError {
            print("Error loading photos from file: \(loadError.localizedDescription)")
        }
    }
}
