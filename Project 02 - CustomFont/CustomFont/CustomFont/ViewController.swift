//
//  ViewController.swift
//  CustomFont
//
//  Created by Samrat on 1/11/16.
//  Copyright © 2016 SMRT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties & Outlets
    @IBOutlet weak var btnChangeFont: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    let allFonts = ["Xeron", "XPED", "Moderata Personal Use"]
    var currentFontIndex = -1
    
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btnChangeFont.layer.cornerRadius = 0.5 * btnChangeFont.bounds.size.width
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Actions
    @IBAction func changeFontTapped(_ sender: UIButton) {
        currentFontIndex = (currentFontIndex + 1) % allFonts.count
        let fontName = allFonts[currentFontIndex]
        
        for view in stackView.subviews {
            if let label = view as? UILabel {
                label.font = UIFont.init(name: fontName, size: 16.0)
            }
        }
    }
}

