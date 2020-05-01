//
//  photo.swift
//  photoviewer
//
//  Created by Ian French on 4/30/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import Foundation


struct Photo: Equatable, Codable {
    var imageData: Data
    var title: String
}




// added codable now in case I am ambitious tonight and add persistence, If not tonight then tomorrow for practice
