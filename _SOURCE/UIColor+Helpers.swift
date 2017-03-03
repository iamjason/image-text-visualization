//
//  UIColor+Helpers.swift
//  ITTTI
//
//  Created by Jason Garrett on 3/3/17.
//  Copyright © 2017 Jason Garrett. All rights reserved.
//

import UIKit

extension UIColor {
  
  var hexString:String {
    get {
      
      var r:CGFloat = 0
      var g:CGFloat = 0
      var b:CGFloat = 0
      var a:CGFloat = 0
      
      getRed(&r, green: &g, blue: &b, alpha: &a)
      
      let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
      
      return String(format:"#%06x", rgb)
    }
  }
  
}
