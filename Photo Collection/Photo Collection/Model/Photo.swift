//
//  Photo.swift
//  Photo Collection
//
//  Created by Dillon McElhinney on 9/6/18.
//  Copyright © 2018 Dillon McElhinney. All rights reserved.
//

import UIKit

struct Photo: Equatable, Codable {
    // MARK: - Properties
    var imageData: Data
    var title: String
    
    // Computed property to calcuate the aspect ratio of the photo. (There has to be a less compute intensive way to do this, but it works)
    var aspect: CGFloat {
        guard let image = UIImage(data: imageData) else { return 1 }
        return image.size.height / image.size.width
    }
}
