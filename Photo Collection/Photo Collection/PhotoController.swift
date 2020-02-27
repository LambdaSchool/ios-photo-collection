//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Wyatt Harrell on 2/27/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create(title: String, imageData: Data) {
        let newPhoto = Photo(title: title, imageData: imageData)
        photos.append(newPhoto)
        saveToPersistentStore()

    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        for i in 0..<photos.count {
            if photos[i] == photo {
                photos[i].title = title
                photos[i].imageData = imageData
                saveToPersistentStore()

            }
        }
    }
    
    init() {
        self.loadFromPersistentStore()
    }
    
    
    // MARK: - Persistence
    
    var photoListURL: URL? {
        let fileManager = FileManager()
        
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let photoPList = "PhotosList.plist"
        
        return documentsDir?.appendingPathComponent(photoPList)
    }
    
    func saveToPersistentStore() {
        let encoder = PropertyListEncoder()
        
        do {
            let photosData = try encoder.encode(photos)

            guard let photosURL = photoListURL else { return }
            
            try photosData.write(to: photosURL)

        } catch {
            print("Unable to save photos to plist \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        
        
        guard let booksURL = photoListURL else { return }
        let decoder = PropertyListDecoder()
        
        do {
            
            let photosData = try Data(contentsOf: booksURL)
            let decodedPhotos = try decoder.decode([Photo].self, from: photosData)
            
            self.photos = decodedPhotos
            
        } catch {
            print("Error decoding photos: \(error)")
        }
        
    }
}
