import UIKit

class PhotosCollectionViewController: UICollectionViewController{
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    var photos: [Photo] = []
    let reuseIdentifier = "cell"
    let targetDimension: CGFloat = 320 //for xib
    
    //registers xib
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "PhotosCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    //calls layout for xib
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let layout = collectionView.setCollectionViewLayout as?
            UICollectionViewFlowLayout else {
            fatalError("Unable to retrieve layout")
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else {return UICollectionViewCell()}
        
        let photo = photos[indexPath.item]
        cell.imageView.image = photo.imageData
        cell.label.text = photo.title
        
        return cell
    }
    
    //more xib details
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Fetch image
        let photo = photos[indexPath.row]
        // Fetch largest dimension of the image, whether width or height
        let maxDimension = max(image.size.width, image.size.height)
        // Calculate how to scale that largest dimension into `targetDimension`
        let scale = targetDimension / maxDimension
        // Return scaled dimensions
        return CGSize(width: photo.size.width * scale, height: photo.size.height * scale)
    }
    
    func setTheme(){
        var themePreference: String? {
            let userDefaults = UserDefaults.standard
            if let themePreference = userDefaults.string(forKey: themePreferenceKey){
                return themePreference
            }
            else{ return }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photoDestination = segue.destination as? PhotoDetailViewController else {return}
        if segue.identifier == "addSegue"{
            PhotoDetailViewController = destination
        if segue.identifier == "selectThemeSegue"{
            ThemeSelectionViewController = destination
       
            //need to add segue from the cell should pass the themeController, photoController, and the photo for some reason I couldn't make the segue
            }
        }
    }
}
