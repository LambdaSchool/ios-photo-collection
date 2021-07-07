import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addPhotoButton(_ sender: Any) {
        PHPhotoLibrary.requestAuthorization { (permission) in
            if permission == .authorized {
                print("User granted us access")
                
                DispatchQueue.main.async{
                    // Get user photo here
                    self.presentImagePickerController() //closures need self
                }
            }
        }
    }
    
    func presentImagePickerController() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self // this specifies that this is the delegate
        present(imagePicker, animated: true, completion: nil)
    }
    
    //picture chosen and then returns image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return }
        imageView.image = image // place image chosen to imageview on storyboard
        
    }
    //dismiss
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func savePhotoButton(_ sender: Any) {
        //update the photo if it has a value, or create a new instance of photo using the methods in the photoController
        guard let title = textField.text,
            let image = imageView.image,
            let imageData = image.pngData() else { return }
        
        if let photo = photo {
            photoController?.updatePhoto(photo: photo, title: title)
        } else {
            photoController?.createPhoto(imageData: imageData, title: title)
        }
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //You can then put that UIImage in the image view. Call it in the viewDidLoad
        updateViews()
        setTheme()

    }
    //not sure how to change this so background changes instead of viewcontroller's view's
    func setTheme(){
        guard let themePreference = themeHelper?.themePreference else {return}
        if themePreference == "Dark" {
            self.view.backgroundColor = .darkGray
        } else {
            self.view.backgroundColor = .blue
        }
        
    }
    func updateViews(){
        // You will need to use the UIImage(data: Data) initializer to convert the photo's imageData to a UIImage
        if let photo = photo {
            navigationItem.title = "Edit Photo"
            imageView?.image = UIImage(data: photo.imageData)
            textField?.text = photo.title
        } else {
            navigationItem.title = "Add Photo"
            
        }
    }
}
