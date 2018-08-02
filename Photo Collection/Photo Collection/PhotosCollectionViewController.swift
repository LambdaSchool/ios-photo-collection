//
//  ViewController.swift
//  Photo Collection
//
//  Created by Simon Elhoej Steinmejer on 02/08/18.
//  Copyright © 2018 Simon Elhoej Steinmejer. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    let photoCell = "photoCell"
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
        setTheme()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupNavBar()
        collectionView?.register(PhotoCell.self, forCellWithReuseIdentifier: photoCell)
        collectionView?.contentInset = UIEdgeInsetsMake(8, 16, 0, 16)
    }
    
    private func setTheme()
    {
        if let themePreference = themeHelper.themePreference
        {
            collectionView?.backgroundColor = themePreference == "Dark" ? .darkGray : .blue
        }
    }
    
    private func setupNavBar()
    {
        title = "Photo Collection"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Select Theme", style: .plain, target: self, action: #selector(presentThemeController))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add
            , target: self, action: #selector(showDetailController))
    }
    
    @objc func presentThemeController()
    {
        let selectThemeController = SelectThemeController()
        selectThemeController.themeHelper = themeHelper
        present(selectThemeController, animated: true, completion: nil)
    }
    
    @objc private func showDetailController()
    {
        let photoDetailViewController = PhotoDetailViewController()
        photoDetailViewController.photoController = self.photoController
        photoDetailViewController.themeHelper = self.themeHelper
        navigationController?.pushViewController(photoDetailViewController, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCell, for: indexPath) as! PhotoCell
        
        let photo = photoController.photos[indexPath.item]
        
        cell.photoImageView.image = UIImage(data: photo.imageData)
        cell.titleLabel.text = photo.title
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return photoController.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 100, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let photo = photoController.photos[indexPath.item]
        let photoDetailViewController = PhotoDetailViewController()
        photoDetailViewController.photoController = self.photoController
        photoDetailViewController.photo = photo
        photoDetailViewController.themeHelper = self.themeHelper
        navigationController?.pushViewController(photoDetailViewController, animated: true)
    }
}
















