//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Nonye on 4/23/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else {
            fatalError("Not a member of the cell")
        }
    
        // Configure the cell
    
        return cell
    }
    
    func setTheme() {
        guard let preference  = themeHelper.themePreference else { return }
        if preference == "Dark" {
            collectionView.backgroundColor = .darkGray
        } else {
            collectionView.backgroundColor = .red
        }
    }


    // MARK: UICollectionViewDelegate

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "SelectThemeSegue" {
     
                }
        }
    }

