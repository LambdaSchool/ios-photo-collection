import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoCaptionTextField: UITextField!
    
    @IBAction func addPhotoButton(_ sender: Any) {
        
        PHPhotoLibrary.requestAuthorization { (status) in
            guard status == .authorized else {
                NSLog("Please allow access to your photos so this thing will work. Please. Please!")
                return
            }
            NSLog("Access Granted! Noice!")
            DispatchQueue.main.async {
                self.presentImagePickerController()
            }
        }
    }
    
    func presentImagePickerController() {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
            photoImageView.contentMode = .scaleAspectFit
            photoImageView.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        
        guard let title = photoCaptionTextField.text,
            let image = photoImageView.image,
            let imageData = image.pngData() else { return }
        
        if let photo = photo {
            photoController?.update(photo, imageData, title)
        } else if photo == nil {
            photoController?.create(imageData: imageData, title: title)
        }
        navigationController?.popViewController(animated: true)
        
    }
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference, !themePreference.isEmpty else { return }
        
        switch themePreference {
        case "Gray":
            view.backgroundColor = .gray
        case "Black":
            view.backgroundColor = .black
        default:
            break
        }
    }
    
    func updateViews() {
        
        setTheme()
        guard let photo = photo,
            !photo.title.isEmpty else { return }
        
        photoImageView.image = UIImage(data: photo.imageData)
        photoCaptionTextField.text = photo.title
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

    }
    
    var photo: Photo? = nil
    var themeHelper: ThemeHelper? = nil
    var photoController: PhotoController? = nil
}
