import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotoCollectionViewController: UICollectionViewController {

    
    var photoController = PhotoController()
    var themeHelper = ThemeHelper()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.reloadData()
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = collectionView.indexPathsForSelectedItems?.first?.row
        if segue.identifier == "ShowDetailSegue" {
            guard let destVC = segue.destination as? PhotoDetailViewController else { return }
            destVC.themeHelper = themeHelper
            destVC.photoController = photoController
            destVC.photo = photoController.photos[indexPath ?? 0]
        }else if segue.identifier == "AddPhotoSegue" {
            guard let destVC = segue.destination as? PhotoDetailViewController else { return }
            destVC.themeHelper = themeHelper
            destVC.photoController = photoController
        }else if segue.identifier == "ThemeSelectModal" {
            guard let destVC = segue.destination as? ThemeSelectionViewController else { return }
            destVC.themeHelper = themeHelper
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell

        cell.photo = photoController.photos[indexPath.row]
        cell.photoNameLabel.text = photoController.photos[indexPath.row].title
        cell.photoView.image = UIImage(data: photoController.photos[indexPath.row].imageData)
        return cell
    }

    
    // MARK: - Methods
    
    func setTheme() {
        guard let themPref = self.themeHelper.themePreference else { return }
        print(themPref)
        if themPref == "Red" {
            self.collectionView.backgroundColor = .red
        }else {
            self.collectionView.backgroundColor = .gray
        }
    }

}
