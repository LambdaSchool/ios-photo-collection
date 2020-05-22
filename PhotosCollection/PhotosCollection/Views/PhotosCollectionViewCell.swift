//
//  PhotosCollectionViewCell.swift
//  PhotosCollection
//
//  Created by Mike Nichols on 5/21/20.
//  Copyright © 2020 Mike Nichols. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!

    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
    }
    
    
    
}
/*
 Delegate Pattern Checklist
 - Protocol. What does the employee need to do for the customer?
    - Order food
    - Update a collection view on another view controller
    - Save a model object
 - Who is the delegator (Customer)?
 - Who is the delegate (Employee)?
 - Adopt/conform to the protocol on the delegate
 - A place where both the delegate and the delegator exist. Set the delegator's `.delegate` property (generally) to `self`.
    - VC -> VC: prepareForSegue
    - Cell -> View: cellForRow or cellForItem
 - The delegator needs to tell the delegate to run its function(s) from the protocol at the appropriate time. When a button is tapped, switch is flipped, etc.
*/

