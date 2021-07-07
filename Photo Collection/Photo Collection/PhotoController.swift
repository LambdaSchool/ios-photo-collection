//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Moses Robinson on 1/16/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class PhotoController {
    
    func createPhoto(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func updatePhoto(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.index(of: photo) else { return }
        photos[index].imageData = imageData
        photos[index].title = title
    }
    //MARK: - Properties
    
    var photos: [Photo] = []
}
