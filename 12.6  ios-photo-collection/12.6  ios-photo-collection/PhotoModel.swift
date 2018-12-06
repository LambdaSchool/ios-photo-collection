import Foundation

class PhotoModel {
    
    // Singleton
    static let shared = PhotoModel()
    private init () {}
    
    // Properties
    private var photos: [Photo] = []
    
    var numberOfPhotos: Int {
        return photos.count
    }
    
    // CRUD
    func addPhoto(title: String, imageData: Data) {
        let photo = Photo(title: title, imageData: imageData)
        photos.append(photo)
    }
    
    func removePhoto(at indexPath: IndexPath) {
        photos.remove(at: indexPath.item)
    }
    
    func toUpdatePhoto(photo: Photo, title: String, imageData: Data) {
        photo.title = title
        photo.imageData = imageData
    }
    
    func photo(at indexPath: IndexPath) -> Photo {
        return photos[indexPath.item]
    }
}
