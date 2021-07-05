//
//  Photo.swift
//  Photo Collection
//
//  Created by Jeremy Taylor on 5/9/19.
//  Copyright © 2019 Bytes-Random L.L.C. All rights reserved.
//

import Foundation

struct Photo: Codable, Equatable {
    var imageData: Data
    var title: String
}
