//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Cora Jacobson on 6/10/20.
//  Copyright © 2020 Cora Jacobson. All rights reserved.
//

import Foundation

class PhotoController {
    
    init() {
        loadFromPersistentStore()
    }
    
    var photos: [Photo] = []
    
    func createPhoto(_ imageData: Data, _ title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
        saveToPersistentStore()
    }
    
    func updatePhoto(_ photo: Photo, _ imageData: Data, _ title: String) {
        if let photoIndex = photos.firstIndex(of: photo) {
            photos[photoIndex].imageData = imageData
            photos[photoIndex].title = title
            saveToPersistentStore()
        }
    }
    
    // MARK: Persistence
    
    private var photoCollectionURL: URL? {
        let fm = FileManager.default
        let filename = "PhotoCollection.plist"
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return dir.appendingPathComponent(filename)
    }
    
    private func saveToPersistentStore() {
        guard let url = photoCollectionURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(photos)
            try data.write(to: url)
        } catch {
            NSLog("Was not able to encode data: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = photoCollectionURL,
            fm.fileExists(atPath: url.path) else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedPhotos = try decoder.decode([Photo].self, from: data)
            photos = decodedPhotos
        } catch {
            NSLog("No data was saved: \(error)")
        }
    }
    
}

