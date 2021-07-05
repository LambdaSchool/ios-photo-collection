import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            updateView()
        }
        }
    
    func updateView() {
        
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelOutlet: UILabel!
}
