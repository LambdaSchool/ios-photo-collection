//
//  Photo.swift
//  Photo Collection
//
//  Created by Wyatt Harrell on 2/27/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import Foundation


struct Photo: Equatable, Codable {
    var title: String
    var imageData: Data
}
