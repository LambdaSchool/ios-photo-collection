import UIKit


let number = Int.max
var numberIsEven : Bool = false 

switch number % 2 {
case 0:
    numberIsEven
default:
    numberIsEven = false
}


func pointCategory( for coordinates: (Double,Double)) -> String {
    switch coordinates {
    case (0,0) :
        return "Origin"
    case (let x,0):
        return "On the x-axis at \(x)"
    case (0,let y):
        return "On the y-axis at \(y)"
    default :
        return " No Category"
    }
}
pointCategory(for: (0,0))
pointCategory(for: (50,0))
pointCategory(for: (0,3))
