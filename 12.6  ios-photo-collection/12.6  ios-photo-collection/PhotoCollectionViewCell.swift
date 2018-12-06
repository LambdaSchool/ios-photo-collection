import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    let reuseIdentifier = "PhotoCell"
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var photoTitleLabel: UILabel!
    
}
