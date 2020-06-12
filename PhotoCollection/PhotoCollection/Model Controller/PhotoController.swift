//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Norlan Tibanear on 6/11/20.
//  Copyright © 2020 Norlan Tibanear. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    
    init() {
        loadPhotoFromPersistenceStore()
    }
    
    // Persistence
    
    var photoPersistenceURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return dir.appendingPathComponent("photoPersistence.plist")
    }
    
    func savePhotoToPersistenceStore() {
        guard let url = photoPersistenceURL else { return }
        do {
            let photoData = PropertyListEncoder()
            let data = try photoData.encode(photos)
            try data.write(to: url)
            
        } catch {
            print("Was not able to encode photo")
        }
    }
    
    
    func loadPhotoFromPersistenceStore() {
        let fm = FileManager.default
        guard let url = photoPersistenceURL, fm.fileExists(atPath: url.path) else { return }
        print(url)
        do {
            let data = try Data(contentsOf: url)
            let decode = PropertyListDecoder()
            let decodePhotos = try decode.decode([Photo].self, from: data)
            photos = decodePhotos
        } catch {
            NSLog("No data was save: \(error)")
        }
    }
    
    
    
    func create(title: String, imageData: Data) {
        let newPhoto = Photo(title: title, imageData: imageData)
        photos.append(newPhoto)
        savePhotoToPersistenceStore()
    }
    
//    func updatePhoto(photo: Photo, title: String, imageData: Data) {
//        guard let index = photos.firstIndex(of: photo) else { return }
//
//        var photo = photos[index] // Getting the specific photo from the index
//        photo.imageData = imageData // Passing the new photo value to the index
//        photo.title = title // Passing the new title to the photo value index
//    }
    
    
    
    func updatePhoto(photo: Photo, data: Data, string: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        var image = photo
        image.imageData = data
        image.title = string
        photos.remove(at: index)
        photos.insert(image, at: index)
        
        savePhotoToPersistenceStore()
    }
    
    
} // END
