import UIKit

private let reuseIdentifier = "Cell"

class PhotoCollectionViewController: UICollectionViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        setupCollectionViewLayout()
        setTheme()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PhotoModel.shared.numberOfPhotos
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        
        // get pieces
        let photo = PhotoModel.shared.photo(at: indexPath)
        let image = UIImage(data: photo.imageData)
        // put pieces together
        cell.photoImageView.image = image
        cell.photoTitleLabel.text = photo.title
        
        return cell
    }
    
    private func setupCollectionViewLayout() {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { fatalError("Unable to retrieve layout")}
        
        let inset: CGFloat = 12
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        let dimension = (collectionView.bounds.width - 36) / 2
        layout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    func setTheme() {
        let theme = ThemeHelper.shared.themePreference
        
        switch theme {
        case "Light":
            navigationController?.navigationBar.barStyle = .default
            // change color of words
            navigationController?.navigationBar.tintColor = .blue
            view.backgroundColor = .white
        case "Dark":
            navigationController?.navigationBar.barStyle = .black
            navigationController?.navigationBar.tintColor = .red
            view.backgroundColor = .darkGray
            
        default:
            break
        }
    }
}
