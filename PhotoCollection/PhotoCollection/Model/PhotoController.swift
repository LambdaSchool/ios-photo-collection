import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func numberOfPhotos() -> Int {
        return photos.count
    }
    
    func create(_ photo: Photo) {
        photos.append(photo)
    }
    
    func update(_ photo: Photo, _ Data: Data, _ photoString: String ) {
        
    }
    
}
