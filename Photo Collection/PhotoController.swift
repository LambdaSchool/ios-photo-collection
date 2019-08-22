//
//  PhotoController.swift
//  Photo Collection
//
//  Created by William Chen on 8/22/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import Foundation
import UIKit

class PhotoController{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var  photos: [Photo] = []
    
    func createPhoto(){
        let image = Data(imageView)
        guard let text = label.text else {return}
        let newPhoto = Photo(imageData: image, title: text)
    }
    
    func updateSomething(_ photo: Photo, _ data: Data, _ string: String){
        
    }
}
