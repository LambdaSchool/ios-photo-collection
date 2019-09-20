//
//  Photo.swift
//  PhotoCollection
//
//  Created by Gi Pyo Kim on 9/19/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

import Foundation

struct Photo: Equatable, Codable {
    var imageData: Data
    var title: String
}
