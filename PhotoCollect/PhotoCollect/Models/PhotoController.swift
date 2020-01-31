//
//  PhotoController.swift
//  PhotoCollect
//
//  Created by Nick Nguyen on 1/30/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

import Foundation

class PhotoController {
    
    
    init() {
        loadFromPersistentStore()
    }
    
    
    var photos = [Photo]()
    
    func createPhoto(title:String,image:Data) {
        let newPhoto = Photo(title: title, imageData: image)
        photos.append(newPhoto)
        saveToPersistStore()
    }
    
    func update(photo: Photo,image:Data,title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        
             var scratch = photo
               
               scratch.imageData = image
               scratch.title = title
               
               photos.remove(at: index)
               photos.insert(scratch, at: index)
        saveToPersistStore()
    }
    
    
    
    var photosURL : URL? {
           let fm = FileManager.default
           guard let documentDirectory = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
           let photosURL = documentDirectory.appendingPathComponent("PhotoList.plist")
           return photosURL
       }
    
    private func saveToPersistStore() {
           guard let fileURL = photosURL else { return }
           do {
                let encoder = PropertyListEncoder()
               let photosData = try encoder.encode(photos)
               try photosData.write(to: fileURL)
           } catch  let err{
               print("Can't save photos.Error : \(err)")
           }
          
       }
       
      private func loadFromPersistentStore() {
           guard let fileURL = photosURL else { return }
           do {
               let photosData = try Data(contentsOf: fileURL)
               let decoder = PropertyListDecoder()
               let decodedPhotos = try  decoder.decode([Photo].self, from: photosData)
               self.photos = decodedPhotos
           } catch let err {
               print("Can't load Data , error: \(err)")
           }
       }
    
}
