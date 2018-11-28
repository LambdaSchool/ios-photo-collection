//
//  PhotoController.swift
//  ios-photo-collection
//
//  Created by Benjamin Hakes on 11/28/18.
//  Copyright © 2018 Benjamin Hakes. All rights reserved.
//
import UIKit

class PhotoController: UIViewController{
    
    var photos: [Photo] = []
    
    func create(_ imageData: Data,_ title: String){
        let result = Photo.init(imageData, title)
        photos.append(result)
    }
    
    func update(for photo: Photo, _ imageData: Data,_ title: String){
        
        guard let location = photos.firstIndex(of: photo) else {return}
        photos.remove(at: location)
        photos.insert(Photo.init(imageData, title), at: location)
        
    }
    
}
