import UIKit

class PhotoDetailViewController: UIViewController {
    
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
        guard let photo = photo else { return }
    }
    
    var photo: Photo? = nil
    var themeHelper: ThemeHelper? = nil
    var photoController: PhotoController? = nil
}
