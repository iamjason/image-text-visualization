//: Playground - noun: a place where people can play

import UIKit

extension String {
  
  var length: Int {
    return self.characters.count
  }
  
  subscript (i: Int) -> String {
    return self[Range(i ..< i + 1)]
  }
  
  func substring(from: Int) -> String {
    return self[Range(min(from, length) ..< length)]
  }
  
  func substring(to: Int) -> String {
    return self[Range(0 ..< max(0, to))]
  }
  
  subscript (r: Range<Int>) -> String {
    let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                        upper: min(length, max(0, r.upperBound))))
    let start = index(startIndex, offsetBy: range.lowerBound)
    let end = index(start, offsetBy: range.upperBound - range.lowerBound)
    return self[Range(start ..< end)]
  }
  
}

func attributes( _ font: UIFont,
                        color: UIColor,
                        alignment: NSTextAlignment = .center,
                        lineSpacing: CGFloat = 0, kerning: CGFloat = 0.0) -> [String : AnyObject] {
  
  let paragraph = NSMutableParagraphStyle()
  paragraph.alignment = alignment
  paragraph.lineSpacing = lineSpacing
  
  let attrs = [NSFontAttributeName:font,
               NSForegroundColorAttributeName:color,
               NSParagraphStyleAttributeName:paragraph,
               NSKernAttributeName:kerning] as [String : Any]
  
  return attrs as [String : AnyObject]
  
}


struct Pixel {
  let red:UInt8
  let green:UInt8
  let blue:UInt8
  let alpha:UInt8
  init(r:UInt8, g:UInt8, b:UInt8, a:UInt8){
    red = r
    green = g
    blue = b
    alpha = a
  }
}
extension Pixel {
  var color:UIColor {
    get {
      return UIColor(red: CGFloat(red)/255.0,
                     green: CGFloat(green)/255.0,
                     blue: CGFloat(blue)/255.0,
                     alpha: CGFloat(alpha)/255.0)
    }
  }
}

extension UIImage {
  
  var width:Int { get { return Int(size.width) } }
  var height:Int { get { return Int(size.height) } }
  
  var pixels: [Pixel] {
    get {
      var pixels = [Pixel]()
      for x in 0..<width {
        for y in 0..<height {
          pixels.append(getPixel(x: x, y: y))
        }
      }
      return pixels
    }
  }
  
  var colors: [UIColor] {
    get {
      return pixels.map { $0.color }
    }
  }
  
  func getPixel(x:Int, y:Int) -> Pixel {
    
    let pixelData = self.cgImage!.dataProvider!.data
    let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
    let pixelPosition: Int = ((width * y) + x) * 4
  
    let r = data[pixelPosition]
    let g = data[pixelPosition+1]
    let b = data[pixelPosition+2]
    let a = data[pixelPosition+3]
    
    return Pixel(r: r, g: g, b: b, a: a)

  }
  
  func getColor(x:Int, y:Int) -> UIColor {
    return getPixel(x: x, y: y).color
  }
  
  func getCharacter(x:Int, y:Int, character:String, color:UIColor) -> NSAttributedString {
    let attr = attributes(UIFont.boldSystemFont(ofSize: 10), color: color, alignment: .left, lineSpacing: 0, kerning: 10)
    return NSAttributedString(string: character, attributes: attr)
  }
  
  func attributedString(str:String) -> NSAttributedString {
    
    var index = 0
    let aStr = NSMutableAttributedString()
    for x in 0..<width {
      for y in 0..<height {
        
        aStr.append(getCharacter(x: x, y: y, character: str[index], color: getColor(x: x, y: y)))
        index = index + 1
        if index >= str.characters.count {
          index = 0
        }
        
      }
      
      aStr.append(NSAttributedString(string: "\n", attributes: nil))
      
    }
    return aStr
    
  }
  
}

let img = UIImage(named: "test-box-2")!
let p1 = img.getPixel(x: 2, y: 2)
let c1 = img.getColor(x: 2, y: 2)
let pixels = img.pixels
let colors = img.colors


let str = "jasongarrettisawesome"

let attr = img.attributedString(str: str)






