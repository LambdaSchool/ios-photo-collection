import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference, !themePreference.isEmpty else { return }
        
        switch themePreference {
        case "Gray":
            collectionView.backgroundColor = .gray
        case "Black":
            collectionView.backgroundColor = .black
        default:
            break
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.numberOfPhotos()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { fatalError("Error: Could not dequeue PhotoCell")}
        
        let photo = photoController.photos[indexPath.item]
        cell.photoImageView.image = UIImage(data: photo.imageData)
        cell.photoLabel.text = photo.title
        
        return cell
    }
    
    // Theme // AddPhoto // PhotoDetail
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoDetail" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController,
            let indexPath = collectionView?.indexPathsForSelectedItems?.first else { return }
            let photo = photoController.photos[indexPath.item]
            
            photoDetailVC.photoController = photoController
            photoDetailVC.photo = photo
            photoDetailVC.themeHelper = themeHelper
            
        } else if segue.identifier == "AddPhoto" {
            guard let addPhotoVC = segue.destination as? PhotoDetailViewController else { return }
            addPhotoVC.photoController = photoController
            addPhotoVC.themeHelper = themeHelper
            
        } else if segue.identifier == "Theme" {
            guard let setThemeVC = segue.destination as? PhotoDetailViewController else { return }
            setThemeVC.themeHelper = themeHelper
        }
    }
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
}
