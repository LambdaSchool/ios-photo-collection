//
//  PhotoController.swift
//  Photo-Collection
//
//  Created by Ilgar Ilyasov on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class PhotoController {
    
    // MARK: Initializer
    
    init(){
        loadFromPersistentStore()
    }
    
    // MARK: - Properties
    
    private(set) var photos = [Photo]()
    
    // MARK: - Computed properties
    
    var persistentFileURL: URL? {
        let fm = FileManager.default
        guard let documentDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentDir.appendingPathComponent("photo-collection.plist")
    }
    
    // MARK: - Persistence functions
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let plistEncoder = PropertyListEncoder()
            let data =  try plistEncoder.encode(photos)
            try data.write(to: url)
        } catch {
            NSLog("Error saving data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = persistentFileURL, fm.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let plistDecoder = PropertyListDecoder()
            photos = try plistDecoder.decode([Photo].self, from: data)
        } catch {
            NSLog("Error loading data: \(error)")
        }
    }
    
    // MARK: - CRUD methods
    
    func createPhoto(title: String, imageData: Data) {
        let newPhoto = Photo(title: title, imageData: imageData)
        photos.append(newPhoto)
        saveToPersistentStore()
    }
    
    func updatePhoto(photo: Photo, title: String, imageData: Data) {
        guard let index = photos.index(of: photo) else { return }
        
        photos[index].title = title
        photos[index].imageData = imageData
        saveToPersistentStore()
    }
}
