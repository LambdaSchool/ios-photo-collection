//
//  PhotoCollectionVC.swift
//  PhotoCollection
//
//  Created by William Bundy on 8/2/18.
//  Copyright © 2018 William Bundy. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell
{
	var photo:Photo! {
		didSet {

		}
	}
}

private let reuseIdentifier = "PhotoCell"

class PhotoDetailVC:UIViewController
{
	var controller:PhotoController!
	var photo:Photo!
}

class PhotoCollectionVC: UICollectionViewController {
	var controller:PhotoController = PhotoController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
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
