//
//  UIImage+Helpers.swift
//  ITTTI
//
//  Created by Jason Garrett on 2/27/17.
//  Copyright © 2017 Jason Garrett. All rights reserved.
//


import UIKit

extension UIImage {
  
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
  

  

  
}

