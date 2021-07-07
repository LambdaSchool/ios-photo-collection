//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Simon Elhoej Steinmejer on 02/08/18.
//  Copyright © 2018 Simon Elhoej Steinmejer. All rights reserved.
//

import Foundation

class PhotoController
{
    //MARK: Properties
    
    private(set) var photos = [Photo]()
    private var persistentFileURL: URL?
    {
        let fm = FileManager.default
        guard let documentsDirectory = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentsDirectory.appendingPathComponent("memories.plist")
    }
    
    //MARK: Persistence
    
    init()
    {
        loadFromPersistence()
    }
    
    
    func saveToPersistence()
    {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(photos)
            try data.write(to: url)
        } catch {
            NSLog("Error saving stars data: \(error)")
        }
    }
    
    func loadFromPersistence()
    {
        let fm = FileManager.default
        guard let url = persistentFileURL, fm.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            photos = try decoder.decode([Photo].self, from: data)
        } catch {
            NSLog("Error loading memories: \(error)")
        }
        
    }
    
    //MARK: Model helper functions
    
    func createPhoto(with imageData: Data, title: String)
    {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
        saveToPersistence()
    }
    
    func updatePhoto(on photo: Photo, imageData: Data, title: String)
    {
        if let index = photos.index(of: photo)
        {
            photos[index].imageData = imageData
            photos[index].title = title
            saveToPersistence()
        }
    }
}















