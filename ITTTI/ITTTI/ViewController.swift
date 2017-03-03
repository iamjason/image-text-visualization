//
//  ViewController.swift
//  ITTTI
//
//  Created by Jason Garrett on 2/25/17.
//  Copyright © 2017 Jason Garrett. All rights reserved.
//

import UIKit
import Cartography
import AEXML
import WebKit

func getPixel(pixelData:CFData, width:Int, x:Int, y:Int) -> Pixel {
  
  let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
  let pixelPosition: Int = ((width * x) + y) * 4
  
  let r = data[pixelPosition]
  let g = data[pixelPosition+1]
  let b = data[pixelPosition+2]
  let a = data[pixelPosition+3]
  
  return Pixel(r: r, g: g, b: b, a: a)
  
}


class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    let img = UIImage(named: "test-box-3")!
//    let img = UIImage(named: "jason-fu")!
    let img = UIImage(named: "logo")!
    let str = "MAVENCLINIC".uppercased()
//    let attr = img.attributedString(str: str)
//    
//    let label = UILabel()
//    label.numberOfLines = 0
//    label.attributedText = attr
//
//    view.addSubview(label)
//    constrain(label){ label in
//      label.center == label.superview!.center
//      label.size == label.superview!.size
//    }
    
    let svg = img.SVGXML(str: str, backgroundColor: UIColor.darkGray).xml
    print(svg)
    
    
    let webv = WKWebView(frame: view.frame)
    webv.backgroundColor = UIColor.lightGray
    view.addSubview(webv)
    webv.loadHTMLString(svg, baseURL: nil)
    
//    
//    let pixelData = img.cgImage!.dataProvider!.data!
//    
//    var pixels = [Pixel]()
//    for x in 0..<img.height {
//      for y in 0..<img.width {
//    
//        pixels.append(getPixel(pixelData: pixelData, width: img.width, x: x, y: y))
//        
//      }
//    }
    
    /*
     <svg width="100" height="100">
     <circle cx="50" cy="50" r="40" stroke="green" stroke-width="4" fill="yellow" />
     Sorry, your browser does not support inline SVG.
     </svg>
     */
    
    
//     id="Layer_1"  xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
//    viewBox="0 0 50 50" enable-background="new 0 0 50 50" xml:space="preserve"
//
//    let attrs = ["xmlns":"http://www.w3.org/2000/svg", "version":"1.1", "width":"100","height":"100"]
//    let svg = AEXMLElement(name: "svg", value: nil, attributes: attrs)
//    
//    let circle = AEXMLElement(name: "circle", value: nil, attributes: ["cx":"50", "cy":"50", "r":"40", "stroke":"ff9900", "stroke-width":"4", "fill":"ff4499"])
//    svg.addChild(circle)
//    print(svg.xml)
    
    
//    <text x="0" y="15" fill="red">I love SVG!</text>
    
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

