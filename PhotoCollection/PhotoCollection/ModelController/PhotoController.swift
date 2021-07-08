//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Carolyn Lea on 8/2/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import Foundation
import UIKit

class PhotoController
{
    private(set) var photos: [Photo] = []
    
    func createPhoto(imageData: Data, title: String)
    {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
        print(photo)
        saveToPersistentStore()
    }
    
    func updatePhoto(photo: Photo, imageData: Data, title: String)
    {
        if let index = photos.index(of: photo)
        {
            var tempPhoto = photo
            tempPhoto.imageData = imageData
            tempPhoto.title = title
            
            photos.remove(at: index)
            photos.insert(tempPhoto, at: index)
            saveToPersistentStore()
        }
    }
    
    private var persistentFileURL: URL?
    {
        let fileManager = FileManager.default
        guard let docDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        return docDir.appendingPathComponent("photoCollection.plist")
    }
    
    func saveToPersistentStore()
    {
        guard let url = persistentFileURL else {return}
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(photos)
            try data.write(to: url)
            print("save to persistent store: \(url)")
        } catch {
            NSLog("Error saving memories data: \(error)")
        }
    }
    
    func loadFromPersistentStore()
    {
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else {return}
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            photos = try decoder.decode([Photo].self, from: data)
            print("loaded from peristent store: \(photos)")
        } catch {
            NSLog("Error loading memories data: \(error)")
        }
    }
}
