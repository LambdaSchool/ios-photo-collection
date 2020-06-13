//
//  Photo.swift
//  PhotoCollection
//
//  Created by Cora Jacobson on 6/10/20.
//  Copyright © 2020 Cora Jacobson. All rights reserved.
//

import Foundation

struct Photo: Equatable, Codable {
    var imageData: Data
    var title: String
}
