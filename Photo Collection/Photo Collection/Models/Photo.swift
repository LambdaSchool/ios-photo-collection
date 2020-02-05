//
//  Photo.swift
//  Photo Collection
//
//  Created by morse on 10/17/19.
//  Copyright © 2019 morse. All rights reserved.
//

import Foundation

struct Photo: Equatable, Codable {
    var title: String
    var imageData: Data
}
