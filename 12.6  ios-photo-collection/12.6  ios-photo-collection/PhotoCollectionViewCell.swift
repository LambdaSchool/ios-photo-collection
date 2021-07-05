import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PhotoCell"
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var photoTitleLabel: UILabel!
    
}
