//
//  Photo.swift
//  PhotoCollection
//
//  Created by Linh Bouniol on 8/2/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import Foundation

struct Photo: Equatable, Codable {
    var title: String
    var imageData: Data
}
