import Foundation

struct Photo: Equatable {
    var imageData: Data
    var title: String
    
    init(imageData: Data, title: String){
        self.imageData = imageData
        self.title = title
    }
}
