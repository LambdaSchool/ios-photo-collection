import UIKit
import Foundation

class PhotoController{
    var photos: [Photo] = []
    
    func create(imageData: Data, title: String){
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, data: Data, title: String){
        guard let index = photos.index(of: photo) else {return}
        
        // remove photo
        photos.remove(at: index)
    }
}
