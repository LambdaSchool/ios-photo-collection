//
//  PhotoModel.swift
//  PhotoCollection
//
//  Created by William Bundy on 8/2/18.
//  Copyright © 2018 William Bundy. All rights reserved.
//

import Foundation
import UIKit

struct Photo
{
	var name:String
	var img:UIImage!
}

class PhotoController
{
	var photos:[Photo] = []

	func add(_ p:Photo)
	{
		photos.append(p)
	}

	@discardableResult
	func create(_ name: String, from: String) -> Photo
	{
		let p = Photo(name:name, img:UIImage(named:from))
		add(p)
		return p
	}

	
}
