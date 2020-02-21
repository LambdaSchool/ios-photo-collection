//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Claudia Contreras on 2/20/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    //MARK: - Persistance
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("photos.plist")
    }
    
    init() {
        loadFromPersistentStore()
    }
    
    func create(imageData: Data, title: String) {
        let newPhoto = Photo(imageData: imageData, title: title)
        photos.append(newPhoto)
        saveToPersistentStore()
    }
    
    func update(Photo: Photo, data: Data, title: String) {
        if let index = photos.firstIndex(of: Photo) {
            var photo = photos[index]
            photo.title = title
            photo.imageData = data
            
            photos[index] = photo
        }
        saveToPersistentStore()
    }
    
    //MARK: - Persistance Methods
    func saveToPersistentStore() {
        
        //place to store the data
        guard let url = persistentFileURL else { return }
        
        //Need to convert the data to something that can be stored on the phone
        do {
            //Get ready to encode the data
            let encoder = PropertyListEncoder()
            
            //the encoded data
            let data = try encoder.encode(photos)
            
            //write to the url
            try data.write(to: url)
            
        } catch {
            print("Error saving photo data: \(error)")
        }
        
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        //Make sure that the file exists at our selected path
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            //pull the data from the url
            let data = try Data(contentsOf: url)
            
            //to decode the data
            let decoder = PropertyListDecoder()
            
            // Decode the data and place in array (we specify what type to decode itself into)
            photos = try decoder.decode([Photo].self, from: data)
            
        } catch {
            print("error loading data: \(error)")
        }
    }
    
}
