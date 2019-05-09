//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Jeremy Taylor on 5/9/19.
//  Copyright © 2019 Bytes-Random L.L.C. All rights reserved.
//

import Foundation

class PhotoController {
    private (set) var photos: [Photo] = []
    
    func createPhoto(with imageData: Data, with title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
        saveToPersistentStore()
    }
    
    func updatePhoto(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        var tempPhoto = photo
        tempPhoto.imageData = imageData
        tempPhoto.title = title
        
        photos.remove(at: index)
        photos.insert(tempPhoto, at: index)
        saveToPersistentStore()
    }
    
    // MARK: - Persistence
    private var persistentFileURL: URL? {
    let fm = FileManager.default
    
    guard let documentsDirectory = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
    
    return documentsDirectory.appendingPathComponent("photoCollection.plist")
}

func saveToPersistentStore() {
    guard let url = persistentFileURL else { return }
    
    let encoder = PropertyListEncoder()
    do {
        let data = try encoder.encode(photos)
        try data.write(to: url)
    } catch {
        NSLog("Couldn't save photo data: \(error)")
    }
}

func loadFromPersistentStore() {
    do {
        let fm = FileManager.default
        guard let url = persistentFileURL, fm.fileExists(atPath: url.path) else { return }
        let data = try Data(contentsOf: url)
        let decoder = PropertyListDecoder()
        let decodedPhotos = try decoder.decode([Photo].self, from: data)
        photos = decodedPhotos
    } catch {
        NSLog("Couldn't load photo data: \(error)")
    }
}
}
