//
//  PhotoController.swift
//  Photo Collection
//
//  Created by William Chen on 8/22/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import Foundation


class PhotoController{

 
    var  photos: [Photo] = []
    
    func createPhoto(){
        let image = Data(imageView)
        guard let text = label.text else {return}
        let newPhoto = Photo(imageData: image, title: text)
    }
    
    func updateSomething(_ photo: Photo, _ data: Data, _ string: String){
        
    }
}
