//
//  Photo.swift
//  MBP-iOS4-PhotoCollection-Dillon-Walkthrough
//
//  Created by Vijay Das on 12/6/18.
//  Copyright © 2018 Vijay Das. All rights reserved.
//

import UIKit

class Photo {
    var title: String
    var imageData: Data
    
    init (title: String, imageData: Data) {
        self.title = title
        self.imageData = imageData
    }
 }
