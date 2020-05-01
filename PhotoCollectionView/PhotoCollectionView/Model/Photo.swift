//
//  Photo.swift
//  PhotoCollectionView
//
//  Created by Clayton Watkins on 4/29/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import Foundation

struct Photo: Equatable, Codable{
    var imageData: Data
    var title: String
}
