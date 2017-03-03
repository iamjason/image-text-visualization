//
//  ITTTITests.swift
//  ITTTITests
//
//  Created by Jason Garrett on 2/25/17.
//  Copyright © 2017 Jason Garrett. All rights reserved.
//

import XCTest
@testable import ITTTI
import AEXML


class ITTTITests: XCTestCase {
  
  
  
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

//    
//    func testPerformanceFirstImplementation() {
//      
//        self.measure {
//          
//          let img = UIImage(named: "test-box-3")!
//          let str = "SHUTTHEFUCKUP".uppercased()
//          let attr = img.attributedString(str: str)
//          
//        }
//    }
//  func testPerformanceFirstImplementationMed() {
//    
//    self.measure {
//      
//      let img = UIImage(named: "jason-fu-med")!
//      let str = "SHUTTHEFUCKUP".uppercased()
//      let attr = img.attributedString(str: str)
//      
//    }
//  }
  
//  func testXMLGeneration(){
//    
//    let img = UIImage(named: "test-box-3")!
//    let str = "SHUTTHEFUCKUP".uppercased()
//    let attr = img.attributedString(str: str)
//
//    
//    let svg = AEXMLElement(name: "svg")
//    svg.add
//    
//    
//  }
//  

  
  func testSVGGenerationPerformance(){
   
    let img = UIImage(named: "logo")!
    let str = "MAVENCLINIC".uppercased()
    
    self.measure {
    
      let svg = img.SVGXML(str: str)
      print(svg.xmlCompact)
      
    }
    
  }
  
  func stop_textSimpleXMLCreationCircle(){
    /*
    <svg width="100" height="100">
    <circle cx="50" cy="50" r="40" stroke="green" stroke-width="4" fill="yellow" />
    Sorry, your browser does not support inline SVG.
    </svg>
    */
    
    let attrs = ["width":"100","height":"100"]
    let xml = AEXMLElement(name: "svg", value: nil, attributes: attrs)
    print(xml.xml)
    
  }
  
  
  
  
}
