//
//  PhotoViewController.swift
//  PhotoCollection
//
//  Created by Brian Rouse on 4/22/20.
//  Copyright © 2020 Brian Rouse. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bgView: UIView!
    
    // MARK: - iVars
    
    var photos: [Photo] = []
    var themeHelper = ThemeHelper()
    
    // MARK: - CellLifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setTheme()
    }

    // MARK: - Helper Methods
    
    private func setupUI() {
        
        self.setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
    }
    
    private func setTheme() {
        let selectedTheme = self.themeHelper.getCurrentSelectedTheme()
        if selectedTheme == "Dark" {
            self.bgView.backgroundColor = UIColor.lightGray
        } else if selectedTheme == "Blue" {
            self.bgView.backgroundColor = UIColor.blue
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhotoSegue" {
            let photoDetailVC = segue.destination as! PhotoDetailViewController
            photoDetailVC.addPhotoDelegate = self
            photoDetailVC.themeHelper = self.themeHelper
        } else if segue.identifier == "SelectThemeSegue" {
            let themeSelectorVC = segue.destination as! ThemeSelectionViewController
            themeSelectorVC.themeHelper = self.themeHelper
        }
    }

}

// MARK: - PhotoDetailViewControllerDelegate

extension PhotoViewController: PhotoDetailViewControllerDelegate {
    
    func addPhotoWithDetail(photoData: Data, photoTitle: String) {
        
        self.photos.append(Photo(imageData: photoData, title: photoTitle))
        self.collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension PhotoViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as? PhotoCollectionViewCell else { fatalError("Unexpected Table View Cell")
        }
        
        if self.photos.indices.contains(indexPath.row) {
            let aPhoto = self.photos[indexPath.row]
            cell.photoImageView.image = UIImage(data: aPhoto.imageData)
            cell.titleLbl.text = aPhoto.title
        }
        
        cell.contentView.backgroundColor = .clear
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: ((collectionView.frame.size.width - 20) / 2), height: ((collectionView.frame.size.width - 20) / 2))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
    }
}
