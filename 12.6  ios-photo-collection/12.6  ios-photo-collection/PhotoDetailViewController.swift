import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // properties
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTitleTextField: UITextField!
    
    // actions -- presents image picker
    @IBAction func addPhoto(_ sender: Any) {
         guard UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) else { return }
        // make it
        let imagePicker = UIImagePickerController()
        // set it up
        imagePicker.sourceType = .photoLibrary //.camera
        
        imagePicker.delegate = self
        // put together
        present(imagePicker, animated: true)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let title = photoTitleTextField.text,
        let image = photoImageView.image,
        let imageData = image.pngData() else { return }
        
        PhotoModel.shared.addPhoto(title: title, imageData: imageData)
        
        // leave this view
        navigationController?.popViewController(animated: true)
    }
    
    // image picker controller
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        defer {  picker.dismiss(animated: true) }
        guard let image = info[.originalImage] as? UIImage else { return }
        photoImageView.image = image
    }
}
