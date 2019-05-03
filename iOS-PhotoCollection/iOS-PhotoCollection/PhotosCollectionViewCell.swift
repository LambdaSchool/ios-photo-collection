import UIKit
import Foundation

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoNameLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        photoNameLabel.text = photo?.title
        photoView.image = UIImage(data: photo!.imageData)
    }
    
    
}
