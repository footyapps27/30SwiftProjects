//
//  ViewController.swift
//  Project 2 - CustomFonts
//
//  Created by Samrat on 12/4/16.
//  Copyright © 2016 SMRT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /***********************************************************/
    // MARK : Properties
    /***********************************************************/
    @IBOutlet weak var lblFont1: UILabel!
    
    @IBOutlet weak var lblFont2: UILabel!
    
    @IBOutlet weak var lblFont3: UILabel!
    /***********************************************************/
    // MARK : View Lifecycle
    /***********************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblFont1.text = "This is normal system font";
        
        lblFont2.text = "This is Xeron font"
        lblFont2.font = UIFont.init(name: "Xeron", size: 16)
        
        lblFont3.text = "This is XPED font"
        lblFont3.font = UIFont.init(name: "XPED", size: 16)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /***********************************************************/
    // MARK : Helper Methods
    /***********************************************************/
}

