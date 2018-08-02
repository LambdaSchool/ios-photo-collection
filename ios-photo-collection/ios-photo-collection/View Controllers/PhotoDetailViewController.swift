import UIKit

class PhotoDetailViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        
    }
    
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var imageView: UIImageView!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
}
