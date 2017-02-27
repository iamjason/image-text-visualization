//
//  AttributedText.swift
//  ITTTI
//
//  Created by Jason Garrett on 2/25/17.
//  Copyright © 2017 Jason Garrett. All rights reserved.
//

import UIKit

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
