//
//  ViewController.swift
//  Project1_SimpleStopWatch
//
//  Created by Samrat on 12/4/16.
//  Copyright © 2016 SMRT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /**********************************************************/
    // MARK: Instance Variables
    /**********************************************************/
    @IBOutlet weak var lblTimer: UILabel!
    
    var myTimer: NSTimer = NSTimer()
    
    var counter: Double = 0.0
    
    /**********************************************************/
    // MARK: View Lifecycle
    /**********************************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblTimer.text = "\(counter)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**********************************************************/
    // MARK: Actions
    /**********************************************************/
    
    /**
     Action to start the timer
    
     - parameter sender: The button that sends the start action
     */
    @IBAction func startTimer(sender:UIButton) {
        if(!myTimer.valid) {
            myTimer = NSTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.timerDidFire(_:)), userInfo: nil, repeats: true)
            NSRunLoop.currentRunLoop().addTimer(myTimer, forMode: NSRunLoopCommonModes)
        }
    }
    
    /**
     Action to stop the timer
     
     - parameter sender: The button that sends the stop action
     */
    @IBAction func stopTimer(sender:UIButton) {
        if(myTimer.valid) {
            myTimer.invalidate()
        }else {
            counter = 0.0
            lblTimer.text = String(format:"%.1f", counter)
        }
        
    }
    
    /**********************************************************/
    // MARK: Helper Methods
    /**********************************************************/
    
    /**
     Timer selector to update the label
     
     - parameter timer: The timer that fired this selector
     */
    func timerDidFire(timer: NSTimer) {
        counter += 0.1
        lblTimer.text = String(format:"%.1f", counter)
    }
}

