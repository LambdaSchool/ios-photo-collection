import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    //create
    func createPhoto(imageData: Data, title: String){
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    //update
    func updatePhoto(photo: Photo, title: String){
        guard let index = photos.index(of: photo) else {return}
        
        photos[index].title = title
    }
}

