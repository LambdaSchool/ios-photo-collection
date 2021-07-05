//
//  File.swift
//  Photos
//
//  Created by Marlon Raskin on 7/25/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation


struct Photo: Equatable, Codable {
	var imageData: Data
	var title: String
}
