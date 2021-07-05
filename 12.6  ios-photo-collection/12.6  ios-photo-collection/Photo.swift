
import Foundation

class Photo {
    var title: String
    // make image data so it restores image on demand from code -- best practice
    var imageData: Data
    init (title: String, imageData: Data) {
        self.title = title
        self.imageData = imageData
    
    

    }
}
