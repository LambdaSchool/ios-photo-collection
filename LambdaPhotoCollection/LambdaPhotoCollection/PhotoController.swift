import UIKit

class PhotoController {
    
    var photos : [Photo] = []
    
    func create (imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    func update(photo: Photo, imageData: Data, title: String) {
        
    }
    
}
