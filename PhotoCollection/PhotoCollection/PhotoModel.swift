//
//  PhotoModel.swift
//  PhotoCollection
//
//  Created by William Bundy on 8/2/18.
//  Copyright © 2018 William Bundy. All rights reserved.
//

import Foundation
import UIKit

struct Photo: Equatable
{
	var name:String
	var img:UIImage!
	static func ==(lhs:Photo, rhs:Photo) -> Bool
	{
		return lhs.name == rhs.name
	}
}

class PhotoController
{
	var photos:[Photo] = []

	func add(_ p:Photo)
	{
		photos.append(p)
	}

	func addUpdate(_ p:Photo)
	{
		if let index = photos.index(of:p) {
			photos[index] = p
		} else {
			add(p)
		}
	}

	@discardableResult
	func create(_ name: String, from: String) -> Photo
	{
		let p = Photo(name:name, img:UIImage(named:from))
		add(p)
		return p
	}

}
