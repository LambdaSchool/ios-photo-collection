import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var photo: Photo?{
        didSet {
            updateViews()
        }
    }
    
    func updateViews(){
        
    }
}
