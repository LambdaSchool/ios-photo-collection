//
//  PhotoCollectionViewController.swift
//  PhotoCollect
//
//  Created by Nick Nguyen on 1/30/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

import UIKit



class PhotoCollectionVC: UICollectionViewController  , UICollectionViewDelegateFlowLayout {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
   
    
    func setTheme() {
        guard let theme = themeHelper.themePreference else { return }
        switch theme {
            
        case "Dark":
            collectionView.backgroundColor = .gray
            
        case "Purple":
            collectionView.backgroundColor = .purple
          
        default:
            break
        }
    }
 
    private func setUpNavBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
             let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
             navigationController?.navigationBar.titleTextAttributes = textAttributes
             collectionView.delegate = self
             navigationController?.navigationBar.backgroundColor = .white
             navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //MARK: - App Life Cycle

    override func viewDidLoad() {
          super.viewDidLoad()
           title = "Photo Collection"
           setUpNavBar()
      }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
      
            setTheme()
           if collectionView.backgroundColor
               == UIColor.gray {
                 navigationController?.navigationBar.backgroundColor = .lightGray
            setUpStatusBarColor(to: UIColor.lightGray)
              
           } else if collectionView.backgroundColor == UIColor.purple {
               navigationController?.navigationBar.backgroundColor = UIColor.systemPurple
            setUpStatusBarColor(to: UIColor.systemPurple)
               
           }
              collectionView.reloadData()
          }
    
    
    func setUpStatusBarColor(to color : UIColor) {
            if #available(iOS 13.0, *) {
                let app = UIApplication.shared
                let statusBarHeight: CGFloat = app.statusBarFrame.size.height

                let statusbarView = UIView()
                statusbarView.backgroundColor = color
                view.addSubview(statusbarView)

                statusbarView.translatesAutoresizingMaskIntoConstraints = false
                statusbarView.heightAnchor
                    .constraint(equalToConstant: statusBarHeight).isActive = true
                statusbarView.widthAnchor
                    .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
                statusbarView.topAnchor
                    .constraint(equalTo: view.topAnchor).isActive = true
                statusbarView.centerXAnchor
                    .constraint(equalTo: view.centerXAnchor).isActive = true

            }
        }
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.tapCellSegue {
            guard let destVC = segue.destination as? PhotoDetailVC else { return }
            destVC.themeHelper = themeHelper
            destVC.photoController = photoController
            guard  let cell = sender as? PhotoCell else { return }
            guard  let indexPath = collectionView.indexPath(for: cell) else { return }
            destVC.photo = photoController.photos[indexPath.item]
        }
        else if segue.identifier == Segue.addSegue {
            guard let destVC = segue.destination as? PhotoDetailVC else { return }
            destVC.photoController = photoController
            destVC.themeHelper = themeHelper
        }
        else if segue.identifier == Segue.themeSegue {
            guard let destVC = segue.destination as? ThemeSettingVC else { return }
            destVC.themeHelper = themeHelper
        }
    }
  

    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
          
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Segue.cellId, for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: view.frame.width  / 3, height: view.frame.width  / 3)
      }

   

}
