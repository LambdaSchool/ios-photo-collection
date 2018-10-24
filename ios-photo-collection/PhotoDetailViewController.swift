import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addPhotoButton(_ sender: Any) {
        //not sure about this
//        directions: The addImage action should present a UIImagePickerController that
//        allows the user to select an image to add to the Photo object.
        
//        Note: Make sure you request authorization to access the photo library,
//        and add the "Privacy - Photo Library Usage Description" key-value pair in
//        the info.plist.
        
//        Note: implement the didFinishPickingMediaWithInfo method to get the image the
//        user selects, then dismiss the image picker.
        
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch authorizationStatus {
        case .authorized:
            presentImagePickerController()
        default:
            PHPhotoLibrary.requestAuthorization { status in
                if status == .authorized {
                    self.presentImagePickerController()
                    
                    didFinishPickingMediaWithInfo: [UIImagePickerController.InfoKey : dismiss])
                }
            }
        }
    }
    
    @IBAction func savePhotoButton(_ sender: Any) {
        //update the photo if it has a value, or create a new instance of photo using the methods in the photoController
        guard let index = photos.index(of: photo) else {return}
        let photoController = PhotoController()
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //You can then put that UIImage in the image view. Call it in the viewDidLoad
        let imageView = UIImage

    }
    //not sure how to change this so background changes instead of viewcontroller's view's
    func setTheme(){
        var themePreference: String? {
            let userDefaults = UserDefaults.standard
            if let themePreference = userDefaults.string(forKey: themePreferenceKey){
                return themePreference
            }
            else{ return }
        }
    }
    func updateViews(){
        setTheme()
        
        // You will need to use the UIImage(data: Data) initializer to convert the photo's imageData to a UIImage
        init(data: Data){
            self.imageData = UIImage
        }
    }

}
