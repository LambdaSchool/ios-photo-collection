//
//  Photo.swift
//  PhotoCollect
//
//  Created by Nick Nguyen on 1/30/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

import Foundation

struct Photo : Equatable , Codable {
    var title: String
    var imageData: Data
}
