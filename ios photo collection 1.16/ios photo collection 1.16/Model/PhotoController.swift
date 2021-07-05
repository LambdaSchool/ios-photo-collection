import Foundation

class PhotoController {
    
    private(set) var photos: [Photo] = []
    
    
    func create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
//        photos.imageData = imageData
//        photos.title = title
//        // create Part PhotoController 1 ? 5
//        
//        
    }
    
}
