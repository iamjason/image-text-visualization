//
//  UIImage+SVG.swift
//  ITTTI
//
//  Created by Jason Garrett on 3/3/17.
//  Copyright © 2017 Jason Garrett. All rights reserved.
//

import UIKit
import AEXML

extension UIImage {
  
  var width:Int { get { return Int(size.width) } }
  var height:Int { get { return Int(size.height) } }
  
  func SVGXML(str:String, backgroundColor:UIColor = UIColor.darkGray) -> AEXMLElement {
    
    let spacing = 12
    let border = 20
    let totalW = width*spacing + border*2
    let totalH = height*spacing + border*2
    
    let attrs = ["xmlns":"http://www.w3.org/2000/svg",
                 "version":"1.1",
                 "width":"\(totalW)",
      "height":"\(totalH)",
      "style":"font-family: 'Courier'; font-size: 10;",
      "xml:space":"perserve"]
    
    let svg = AEXMLElement(name: "svg", value: nil, attributes: attrs)
    let box = AEXMLElement(name: "rect", value: nil, attributes: ["width":"\(totalW)",
      "height":"\(totalH)", "fill":backgroundColor.hexString])
    svg.addChild(box)
    
    var xPos = border
    var yPos = border + spacing
    var index = 0
    for y in 0..<height {
      for x in 0..<width {
        
        let pixel = getPixel(x: y, y: x)
        let attrs = ["font-family":"Courier",
                     "font-size":"10",
                     "x":"\(xPos)", "y":"\(yPos)", "fill":"\(pixel.hexString)"]
        let t = AEXMLElement(name: "text",
                             value: str[index],
                             attributes: attrs)
        svg.addChild(t)
        
        index = index + 1
        if index >= str.characters.count {
          index = 0
        }
        
        xPos = xPos + spacing
        
      }
      
      xPos = border
      yPos = yPos + spacing
      
    }
    
    return svg
    
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
  
  
}
