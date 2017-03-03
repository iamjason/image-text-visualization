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
  
  func toHexString() -> String {
    var r:CGFloat = 0
    var g:CGFloat = 0
    var b:CGFloat = 0
    var a:CGFloat = 0
    
    color.getRed(&r, green: &g, blue: &b, alpha: &a)
    
    let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
    
    return String(format:"#%06x", rgb)
  }
  
}
