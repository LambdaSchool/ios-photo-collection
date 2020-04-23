//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Brian Rouse on 4/22/20.
//  Copyright © 2020 Brian Rouse. All rights reserved.
//

import UIKit

protocol PhotoDetailViewControllerDelegate: class {
    func addPhotoWithDetail(photoData: Data, photoTitle: String)
}

class PhotoDetailViewController: UIViewController {

    // MARK: -
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    // MARK: - iVars
    
    var imagePicker = UIImagePickerController()
    var imageData: Data?
    weak var addPhotoDelegate: PhotoDetailViewControllerDelegate?
    var themeHelper: ThemeHelper?
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleTextField.delegate = self
        self.imagePicker.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setTheme()
    }
    
    // MARK: - Helper Methods
    
    private func openGallary() {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.modalPresentationStyle = .fullScreen
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    private func setTheme() {
        if let tHelper = self.themeHelper {
            let selectedTheme = tHelper.getCurrentSelectedTheme()
            if selectedTheme == "Dark" {
                self.bgView.backgroundColor = UIColor.lightGray
            } else if selectedTheme == "Blue" {
                self.bgView.backgroundColor = UIColor.blue
            }
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func addPhotoBtnDidTapped(_ sender: UIButton) {
        self.openGallary()
    }
    
    @IBAction func saveNavBarBtnDidTapped(_ sender: UIBarButtonItem) {
        if !(self.titleTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true), let photoData = self.imageData {
            self.addPhotoDelegate?.addPhotoWithDetail(photoData: photoData, photoTitle: self.titleTextField.text ?? "")
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension PhotoDetailViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Local variable inserted by Swift 4.2 migrator.
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)

        let image = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as! UIImage
        self.photoImageView.image = image
        
        dismiss(animated:true, completion: {
            self.imageData = image.pngData()
            
        })
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated:true, completion: nil)
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}
