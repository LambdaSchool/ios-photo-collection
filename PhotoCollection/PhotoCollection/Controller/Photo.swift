//
//  Photo.swift
//  PhotoCollection
//
//  Created by Chad Rutherford on 11/14/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import Foundation

/// Model Struct for Photos
struct Photo: Equatable, Codable {
    var imageData: Data
    var title: String
}
