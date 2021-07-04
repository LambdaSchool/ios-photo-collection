import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "PhotoCell"
    
    @IBOutlet var photoLabel: UILabel!
    @IBOutlet var photoImageView: UIImageView!

    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
        guard let photo = photo else { return }
        photoLabel.text = photo.title
        photoImageView.image = UIImage(data: photo.imageData)
    }
}
