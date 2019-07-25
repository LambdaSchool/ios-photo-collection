//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Bradley Yin on 7/25/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import Foundation

class PhotoController{
    var photos: [Photo] = []
    
    var photoURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return dir.appendingPathComponent("photo.plist")
        
    }
    
    init() {
        loadFromPersistentStorage()
    }
    
    func saveToPersistentStorage() {
        guard let url = photoURL else { return }
        let encoder = PropertyListEncoder()
        do {
           let data = try encoder.encode(photos)
            try data.write(to: url)
        }
        catch {
            print("Error saving data.")
        }
    }
    
    func loadFromPersistentStorage() {
        let fm = FileManager.default
        guard let url = photoURL, fm.fileExists(atPath: url.path) else { return }
        do {
            let data = try Data (contentsOf: url)
            let decoder = PropertyListDecoder()
            photos = try decoder.decode([Photo].self, from: data)
        }
        catch {
            print("Error loading data.")
        }
    }
    
    func updatePhoto(photo: Photo, data: Data, string: String){
        
    }
}
