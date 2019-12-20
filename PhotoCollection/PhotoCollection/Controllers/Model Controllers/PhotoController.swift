//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Lambda_School_loaner_226 on 12/19/19.
//  Copyright © 2019 JamesMcDougall. All rights reserved.
//

import UIKit

class PhotoController
{
    var photos: [Photo] = []
    
    func create(imageData: Data, title: String)
    {
        let photoCreation = Photo(imageData: imageData, title: title)
        photos.append(photoCreation)
    }
    
    func update(photo: Photo, data: Data, string: String)
    {
        
    }
}
