//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Joshua Rutkowski on 12/12/19.
//  Copyright © 2019 Joshua Rutkowski. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    
    @IBOutlet weak var addPhotoImageView: UIImageView!
    @IBOutlet weak var addTitleTextField: UITextField!
    
    // MARK: - Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
         setTheme()
         guard let imageData = photo?.imageData else { return }

         addPhotoImageView.image = UIImage(data: imageData)
         addTitleTextField.text = photo?.title
     }
    
    func setTheme() {
         guard let themePreference = themeHelper?.themePreferenceKey else { return }
         switch themePreference {
         case ThemeHelper.PropertyKeys.dark:
             view.backgroundColor = .darkGray
         case ThemeHelper.PropertyKeys.blue:
             view.backgroundColor = .blue
         default:
             view.backgroundColor = .white
         }
     }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - IBActions
    
    @IBAction func addPhoto(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
         imagePicker.delegate = self

         let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
         let cancelAlert = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
         alertController.addAction(cancelAlert)

         if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
             let photoLibrary = UIAlertAction(title: "Photo Library", style: .default, handler: {
                 (_) in imagePicker.sourceType = .photoLibrary
                 self.present(imagePicker, animated: true, completion: nil)
             })
             alertController.addAction(photoLibrary)
         }
         present(alertController,animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let title = addTitleTextField.text, let data = addPhotoImageView.image?.pngData() else { return }
         if let photo = photo {
            photoController?.updatePhoto(photo: photo, data: data, title: title)
            
         } else {
            photoController?.createPhoto(named: title, with: data)
         }
         navigationController?.popViewController(animated: true)

    }
    
}

extension PhotoDetailViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage, let _ = image.pngData() else { return }

        addPhotoImageView.image = image

        dismiss(animated: true, completion: self.updateViews)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
