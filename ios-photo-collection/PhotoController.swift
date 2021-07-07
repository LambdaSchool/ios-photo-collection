//
//  PhotoController.swift
//  ios-photo-collection
//
//  Created by Taylor Lyles on 5/2/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    init() {
        
    }
    
	func createPhoto(titled title: String, imageData: Data) {
		let newPhoto = Photo(imageData: imageData, title: title)
        photos.append(newPhoto)
    }
    
	func update(photo: Photo, withImage imageData: Data, titled title: String) {
		guard let photoIndex = photos.firstIndex(of: photo) else { return }
		photos[photoIndex].imageData = imageData
		photos[photoIndex].title = title
    }
    
}
