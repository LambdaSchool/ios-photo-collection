//
//  PhotoController.swift
//  Photos
//
//  Created by Marlon Raskin on 7/25/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation


class PhotoController {

	init() {
		loadFromPersistentStore()
	}

	var photos = [Photo]()

	var persistentFileURL: URL? {
		let fm = FileManager.default
		guard let directory = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
		return directory.appendingPathComponent("photos.plist")
}


	// MARK: - Photo Functions (Add, Update, & Delete)

	func addPhoto(photo: Photo) {
		photos.append(photo)
		saveToPersistentStore()
	}

	func updatePhoto(photo: Photo, data: Data, title: String) {
		guard let index = photos.firstIndex(of: photo) else { return }
		photos[index].imageData = data
		photos[index].title = title
		saveToPersistentStore()
	}

	func deletePhoto(photo: Photo) {
		guard let index = photos.firstIndex(of: photo) else { return }
		photos.remove(at: index)
		saveToPersistentStore()
	}


	// MARK: - Save & Load Persistence

	private func saveToPersistentStore() {
		guard let url = persistentFileURL else { return }
		do {
			let encoder = PropertyListEncoder()
			let data = try encoder.encode(photos)
			try data.write(to: url)
		} catch {
			NSLog("Error loading photos data: \(error)")
		}
	}

	private func loadFromPersistentStore() {
		let fm = FileManager.default
		guard let url = persistentFileURL,
			fm.fileExists(atPath: url.path) else { return }
		do {
			let decoder = PropertyListDecoder()
			let data = try Data(contentsOf: url)
			photos = try decoder.decode([Photo].self, from: data)
		} catch {
			NSLog("Error loading data: \(error)")
		}
	}
}
