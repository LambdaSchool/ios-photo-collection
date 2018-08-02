//
//  PhotoCollectionVC.swift
//  PhotoCollection
//
//  Created by William Bundy on 8/2/18.
//  Copyright © 2018 William Bundy. All rights reserved.
//

import UIKit
import Photos

class PhotoCell: UICollectionViewCell
{
	@IBOutlet weak var imgView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	var photo:Photo! {
		didSet {
			imgView.image = photo.img
			nameLabel.text = photo.name
		}
	}
}

private let reuseIdentifier = "PhotoCell"

class ThemeController
{
	static let greyColor = UIColor(red:0.5, green: 0.5, blue: 0.5, alpha: 1.0)
	static let blueColor = UIColor(red:0.5, green: 0.8, blue: 1.0, alpha: 1.0)
	static let themeColors = [greyColor, blueColor]
	static let themeKey = "PhotoCollectionTheme"
	static var themeIndex: Int {
		get { return UserDefaults.standard.integer(forKey: ThemeController.themeKey) }
		// we could do bounds checking here, but whatever
		set { UserDefaults.standard.set(newValue, forKey: ThemeController.themeKey) }
	}

	static func getTheme() -> UIColor {
		return ThemeController.themeColors[themeIndex]
	}
}

class PhotoDetailVC:UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate

{
	var controller:PhotoController!
	var photo:Photo!


	@IBOutlet weak var nameField: UITextField!
	@IBOutlet weak var imgView: UIImageView!

	override func viewWillAppear(_ animated: Bool) {
		view.backgroundColor = ThemeController.getTheme()
	}

	@IBAction func choosePhoto(_ sender: Any)
	{
		PHPhotoLibrary.requestAuthorization({auth in return})
		if PHPhotoLibrary.authorizationStatus() != .authorized {
			print("Please allow photo access under Privacy->Photos in settings")
			return
		}

		DispatchQueue.main.async {
			let picker = UIImagePickerController()
			picker.sourceType = .photoLibrary
			picker.delegate = self
			self.present(picker, animated:true)
		}
	}

	@objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
	{
		picker.dismiss(animated: true, completion: nil)
		guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {return}
		imgView.image = image
	}

	@objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
	{
		picker.dismiss(animated: true, completion: nil)
	}

	@IBAction func saveNewPhoto(_ sender: Any) {
		if photo == nil {
			photo = Photo(name:"", img:nil)
		}

		guard let name = nameField.text,
			let img = imgView.image else {return}

		photo.img = img
		photo.name = name
		controller.addUpdate(photo)
		navigationController?.popViewController(animated: true)
	}
}

class PhotoCollectionVC: UICollectionViewController
{
	var controller:PhotoController = PhotoController()

	@IBAction func modalReturn(sender:UIStoryboardSegue) {}

    override func viewDidLoad() {
        super.viewDidLoad()
    }

	override func viewWillAppear(_ animated: Bool) {
		collectionView?.backgroundColor = ThemeController.getTheme()
		collectionView?.reloadData()
	}

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		super.prepare(for: segue, sender: sender)
		if let dest = segue.destination as? PhotoDetailVC {
			dest.controller = controller
			if let sender = sender as? PhotoCell {
				dest.photo = sender.photo
			}
			return
		}
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return controller.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCell

		cell.photo = controller.photos[indexPath.item]

        return cell
    }
}

class ThemeChooserVC:UIViewController {
	
	@IBAction func chooseDarkTheme(_ sender: Any) {
		ThemeController.themeIndex = 0
		dismiss(animated: true, completion: nil)
	}

	@IBAction func chooseBlueTheme(_ sender: Any) {
		ThemeController.themeIndex = 1
		dismiss(animated: true, completion: nil)
	}
}
