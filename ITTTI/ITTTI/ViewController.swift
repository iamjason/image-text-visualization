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

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
//    let img = UIImage(named: "test-box-3")!
//    let img = UIImage(named: "jason-fu")!
    let img = UIImage(named: "logo")!
    let str = "importuuidimportdatetimefromstripeimporterrorasstripe_errorfromsqlalchemyimport(Column,DateTime,Integer,String,ForeignKey,Boolean,Text,UniqueConstraint,Date)fromsqlalchemyimportand_,or_,ascfromsqlalchemy.dialects.mysqlimportDOUBLEfromsqlalchemy.ormimportrelationship,backreffromsqlalchemy.orm.excimportNoResultFoundfrommodels.paymentsimportMONEY_PRECISION,StripeMemberClient,Creditfrommodels.referralsimportReferralCode"

    let svg = img.SVGXML(str: str, backgroundColor: UIColor.darkGray).xml
    print(svg)
    
    let webv = WKWebView(frame: view.frame)
    webv.backgroundColor = UIColor.lightGray
    view.addSubview(webv)
    webv.loadHTMLString(svg, baseURL: nil)
    
  }

}

