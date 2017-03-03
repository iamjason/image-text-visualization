//
//  ViewController.swift
//  img-text-image
//
//  Created by Jason Garrett on 3/2/17.
//  Copyright © 2017 Jason Garrett. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let img = NSImage(named: "logo")
     let str = "MAVENCLINIC".uppercased()
    let svg = img.SVGXML(str: str, backgroundColor: NSColor.darkGray).xml
    print(svg)
    
    
    let webv = WKWebView(frame: view.frame)
    webv.backgroundColor = NSColor.lightGray
    view.addSubview(webv)
    webv.loadHTMLString(svg, baseURL: nil)
    

    // Do any additional setup after loading the view.
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }


}

