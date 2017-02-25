import UIKit

public struct Pixel {
  let red:UInt8
  let green:UInt8
  let blue:UInt8
  let alpha:UInt8
  public init(r:UInt8, g:UInt8, b:UInt8, a:UInt8){
    red = r
    green = g
    blue = b
    alpha = a
  }
}

public extension Pixel {
  var color:UIColor {
    get {
      return UIColor(red: CGFloat(red)/255.0,
                     green: CGFloat(green)/255.0,
                     blue: CGFloat(blue)/255.0,
                     alpha: CGFloat(alpha)/255.0)
    }
  }
}
