//
//  ViewController.swift
//  StopWatch
//
//  Created by Samrat on 31/10/16.
//  Copyright © 2016 SMRT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /********************************/
    //MARK - Properties
    /********************************/
    @IBOutlet weak var lblDisplayTimer: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnPause: UIButton!
    
    var timer: Timer!
    var currentTimerCount = 0.0
    /********************************/
    //MARK - View Lifecycle
    /********************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //initializeTimer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /********************************/
    //MARK - Actions
    /********************************/
    @IBAction func pauseTapped(_ sender: UIButton) {
        // Enable the play button if it is disabled
        if(!btnPlay.isEnabled) {
            btnPlay.isEnabled = true
        }
        
        if(timer.isValid) {
            timer.invalidate()
        }else {
            currentTimerCount = 0.0
            updateTimerDisplay()
        }
    }
    
    @IBAction func playTapped(_ sender: UIButton) {
        initializeTimer()
        // Once the timer starts, disable the start button
        btnPlay.isEnabled = false
    }
    
    /********************************/
    //MARK - Helpers
    /********************************/
    func initializeTimer() {
        //currentTimerCount = 0.0
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateTimerCount), userInfo: nil, repeats: true);
    }
    
    func updateTimerCount() {
        currentTimerCount += 0.1
        currentTimerCount = currentTimerCount.roundToPlaces(1)
        updateTimerDisplay()
    }
    
    func updateTimerDisplay() {
        lblDisplayTimer.text = String(currentTimerCount)
    }
}
/**
 This extension was added since the Double was not giving 1 digit precsion & this led to error display.
 Taken from
 http://stackoverflow.com/questions/27338573/rounding-a-double-value-to-x-number-of-decimal-places-in-swift
 */
extension Double {
    /// Rounds the double to decimal places value
    func roundToPlaces(_ places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
