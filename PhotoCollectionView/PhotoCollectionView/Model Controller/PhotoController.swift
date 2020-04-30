//
//  PhotoController.swift
//  PhotoCollectionView
//
//  Created by Clayton Watkins on 4/29/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import Foundation

class PhotoController {
    
    //MARK: - Properties
    
    var photos: [Photo] = []
    
    //MARK: - Helper Methods
    
    func create(imgData: Data, imgName: String){
        let newPhoto = Photo(imageData: imgData, title: imgName)
        photos.append(newPhoto)
    }
    
    func update(photo: Photo, data: Data, string: String){
        guard let index = photos.firstIndex(of: photo) else { return }
        var image = photo
        image.imageData = photo.imageData
        image.title = photo.title
        photos.remove(at: index)
        photos.insert(image, at: index)
    }
    
}
