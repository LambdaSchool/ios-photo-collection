//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Nichole Davidson on 2/27/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private var imageView = UIImageView()
    private var label = UILabel()
    
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           setUpSubviews()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           setUpSubviews()
       }
    
    func updateViews() {
        guard let photo = photo else { return }
        
        imageView.image = UIImage(data: photo.imageData)
        label.text = photo.title
                
    }
    
    func setUpSubviews() {
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        addSubview(imageView)
        
       NSLayoutConstraint(item: imageView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .top,
                               multiplier: 1,
                               constant: 2).isActive = true
            
            NSLayoutConstraint(item: imageView,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .leading,
                               multiplier: 1,
                               constant: 2).isActive = true
            
            NSLayoutConstraint(item: imageView,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .trailing,
                               multiplier: 1,
                               constant: -2).isActive = true
            
            NSLayoutConstraint(item: imageView,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: imageView,
                               attribute: .width,
                               multiplier: 2/3,
                               constant: 0).isActive = true
            
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            
            addSubview(label)
           
            NSLayoutConstraint(item: label,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: imageView,
                               attribute: .bottom,
                               multiplier: 1,
                               constant: 4).isActive = true
            
            NSLayoutConstraint(item: label,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .leading,
                               multiplier: 1,
                               constant: 2).isActive = true
            
            NSLayoutConstraint(item: label,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .trailing,
                               multiplier: 1,
                               constant: -2).isActive = true
            
        }
        
    
}
