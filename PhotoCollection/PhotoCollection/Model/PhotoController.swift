import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func numberOfPhotos() -> Int {
        return photos.count
    }
    
    func create(imageData: Data, title: String) {
        let createPhoto = Photo(imageData: imageData, title: title)
        photos.append(createPhoto)
    }
    
    func update(_ photo: Photo, _ imageData: Data, _ title: String ) {
        guard let index = photos.index(of: photo) else { return }
        
        var scratch = photo
        
        scratch.imageData = imageData
        scratch.title = title
        
        photos.remove(at: index)
        photos.insert(scratch, at: index)
    }
    
}
