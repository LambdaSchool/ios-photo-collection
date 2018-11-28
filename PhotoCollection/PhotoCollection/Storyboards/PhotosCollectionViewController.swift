import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.numberOfPhotos()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { fatalError("Error: Could not dequeue PhotoCell")}
        
        return cell
    }
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
}
