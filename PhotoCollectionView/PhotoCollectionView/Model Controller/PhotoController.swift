//
//  PhotoController.swift
//  PhotoCollectionView
//
//  Created by Clayton Watkins on 4/29/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import Foundation

class PhotoController {
    
    init(){
        loadFromPersistentStore()
    }
    
    //MARK: - Properties
    var photos: [Photo] = []
    var persistentFileURL: URL?{
        let fm = FileManager.default
        let documents = fm.urls(for: .documentDirectory, in: .userDomainMask).first
        return documents?.appendingPathComponent("photos.plist")
    }
    //MARK: - Persistence
    func saveToPersistentStore(){
        guard let url = persistentFileURL else {return}
        do{
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(self.photos)
            try data.write(to: url)
        }catch{
            print("Error encoding data to photos.plist")
        }
    }
    
    func loadFromPersistentStore(){
        let fm = FileManager.default
        guard let url = persistentFileURL,
            fm.fileExists(atPath: url.path) else {return}
        do{
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            self.photos = try decoder.decode([Photo].self, from: data)
        }catch{
            print("Error decoding data from photos.plist")
        }
    }
    
    //MARK: - Helper Methods
    
    func create(imgData: Data, imgName: String){
        let newPhoto = Photo(imageData: imgData, title: imgName)
        photos.append(newPhoto)
        saveToPersistentStore()
    }
    
    func update(photo: Photo, data: Data, string: String){
        guard let index = photos.firstIndex(of: photo) else { return }
        var image = photo
        image.imageData = data
        image.title = string
        photos.remove(at: index)
        photos.insert(image, at: index)
        saveToPersistentStore()
    }
    
}
