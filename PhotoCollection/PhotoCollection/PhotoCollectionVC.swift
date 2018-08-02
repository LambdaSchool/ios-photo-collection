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

class PhotoDetailVC:UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate

{
	var controller:PhotoController!
	var photo:Photo!

	override func viewWillAppear(_ animated: Bool) {
		if photo == nil {
			photo = Photo("", nil)
		}
	}


	@IBOutlet weak var nameField: UITextField!
	@IBOutlet weak var imgView: UIImageView!
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
		photo.img = image
		imgView.image = image
	}

	@objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
	{
		picker.dismiss(animated: true, completion: nil)
	}

	@IBAction func saveNewPhoto(_ sender: Any) {
	}
}

class PhotoCollectionVC: UICollectionViewController
{
	var controller:PhotoController = PhotoController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

	override func viewWillAppear(_ animated: Bool) {
		collectionView?.reloadData()
	}

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let dest = segue.destination as? PhotoDetailVC {
			dest.controller = controller
			if let sender = sender as? PhotoCell {
				dest.photo = sender.photo
			}
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
