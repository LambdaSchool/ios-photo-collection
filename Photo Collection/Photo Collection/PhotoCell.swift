//
//  PhotoCell.swift
//  Photo Collection
//
//  Created by Simon Elhoej Steinmejer on 02/08/18.
//  Copyright © 2018 Simon Elhoej Steinmejer. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell
{
    let photoImageView: UIImageView =
    {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        
        return iv
    }()
    
    let titleLabel: UILabel =
    {
        let label = UILabel()
        label.textAlignment = .center
        label.sizeToFit()
        
        return label
    }()
    
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        backgroundColor = .clear
        setupUI()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI()
    {
        addSubview(photoImageView)
        addSubview(titleLabel)
        
        photoImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: self.frame.height - 28)
        titleLabel.anchor(top: photoImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 0, paddingRight: 0, paddingBottom: -4, width: 0, height: 0)
    }
    
}

















