//
//  PhotoController.swift
//  Photos
//
//  Created by Victor  on 5/2/19.
//  Copyright © 2019 com.Victor. All rights reserved.
//

import Foundation
import UIKit


class PhotoController {
    
    var photos: [Photo] = []
    let image = UIImage(named: "Dog")
    
    
    init() {
        //default photo
        let data = image?.pngData()
        let photo = Photo(imageData: data!, title: "Hello")
        photos.append(photo)
    }
    
    func create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        //getting the location of each photo
        guard let index = photos.index(of: photo) else {return}
        
        photos[index].imageData = imageData
        photos[index].title = title
    }
    
    
    
    
}
