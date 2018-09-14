//
//  Photo.swift
//  Photo-Collection
//
//  Created by Ilgar Ilyasov on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct Photo: Equatable, Codable {
    
    // MARK: - Properties
    
    var imageData: Data
    var title: String
    
    // MARK: - Initializer
    
    init(title: String, imageData: Data) {
        self.title = title
        self.imageData = imageData
    }
}
