import UIKit
import Foundation

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTextField: UITextField!
    
    @IBAction func addPhoto(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    
    // MARK: - UIPickerControllerDelegate Methods
    var imageData: Data?
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        if let imageData = image.jpegData(compressionQuality: 0.8) {
            
            self.imageData = imageData
            detailImageView.image = UIImage(data: imageData)
        }
        dismiss(animated: true)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        if let photo = photo {
            photoController?.update(photo: photo, data: imageData ?? photo.imageData, title: detailTextField.text ?? "")
        }else {
            photoController?.create(imageData: self.imageData!, title: detailTextField.text ?? "")
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    

    
    // MARK: - Helper Methods
    func setTheme() {
        guard let themPref = themeHelper?.themePreference else { return }
        if themPref == "Red" {
            view.backgroundColor = .red
        }else {
            view.backgroundColor = .gray
        }
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        detailImageView.image = UIImage(data: photo.imageData)
        detailTextField.text = "ARGHHH!"//photo.title
    }

}
