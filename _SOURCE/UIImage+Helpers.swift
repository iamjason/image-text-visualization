//
//  UIImage+Helpers.swift
//  ITTTI
//
//  Created by Jason Garrett on 2/27/17.
//  Copyright © 2017 Jason Garrett. All rights reserved.
//

import UIKit
import AEXML

extension UIColor {
  
  func toHexString() -> String {
    
    var r:CGFloat = 0
    var g:CGFloat = 0
    var b:CGFloat = 0
    var a:CGFloat = 0
    
    getRed(&r, green: &g, blue: &b, alpha: &a)
    
    let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
    
    return String(format:"#%06x", rgb)
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
    let pixelPosition: Int = ((width * x) + y) * 4
    
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
    
    let attr = attributes(UIFont(name: "Courier", size: 10)!, color: color, alignment: .left, lineSpacing: 0, kerning: 8)
    return NSAttributedString(string: character, attributes: attr)
  }
  
  func attributedString(str:String) -> NSAttributedString {
    
    var index = 0
    let aStr = NSMutableAttributedString()
    
    // this is wacky... but it seems to work,
    // i think a rotation of the initial image
    // might fix this oddity
    for x in 0..<height {
      for y in 0..<width {
        
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
  
  
  
  func SVGXML(str:String, backgroundColor:UIColor = UIColor.darkGray) -> AEXMLElement {
    
    let spacingHort = 13
    let spacingVert = 13
    
    var index = 0
    // "style":"font-family: 'Source Code Pro'; font-size: 10; font-weight: 100;",
    //  font-weight: 100;
    let attrs = ["xmlns":"http://www.w3.org/2000/svg",
                 "version":"1.1",
                 "width":"\(width*spacingHort)",
                 "height":"\(height*spacingVert)",
                 "style":"font-family: 'Courier'; font-size: 10;",
                 "xml:space":"perserve"]
    
    let svg = AEXMLElement(name: "svg", value: nil, attributes: attrs)
    let box = AEXMLElement(name: "rect", value: nil, attributes: ["width":"\(width*spacingHort)",
      "height":"\(height*spacingVert)", "fill":backgroundColor.toHexString()])
    
    svg.addChild(box)
    // this is wacky... but it seems to work,
    // i think a rotation of the initial image
    // might fix this oddity
    for y in 0..<height {
      for x in 0..<width {
        
        let pixel = getPixel(x: y, y: x)
        let attrs = ["font-family":"Courier",
                     "font-size":"10",
                     "x":"\(x*spacingHort)", "y":"\(y*spacingVert)", "fill":"\(pixel.toHexString())"]
        let t = AEXMLElement(name: "text",
                             value: str[index],
                             attributes: attrs)
        svg.addChild(t)
        
        index = index + 1
        if index >= str.characters.count {
          index = 0
        }
        
      }
      
     // aStr.append(NSAttributedString(string: "\n", attributes: nil))
      
    }
    
    return svg
    
  }
  
  
  
}

