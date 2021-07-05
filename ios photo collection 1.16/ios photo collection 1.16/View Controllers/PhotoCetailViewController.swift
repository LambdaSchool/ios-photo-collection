

import UIKit

class PhotoCetailViewController: UIViewController {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    func updateViews() {
        if let photo = photo {
            navigationItem.title = "Edit Photo"
            imageView?.image = UIImage(data: photo.imageData)
            textLabel?.text = photo.title
        } else {
            navigationItem.title = "Add Photo"
        }
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        
        guard let title = textLabel.text,
            //let bodyText = textLabel.text,
            let image = imageView.image,
            let imageData = image.pngData() else { return }
        // jpegData(compressionQuality: 1.0)
        //image.pngData()
        
//        if let photo = photo {
//            photoController?.update(photo: photo, imageData: imageData, title: title)
//
//            textLabel.text = nil
//        } else {
//
            photoController?.create(imageData: imageData, title: title)
        
         textLabel.text = nil
        
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func saveAction(_ sender: Any) {
    }
    
}
