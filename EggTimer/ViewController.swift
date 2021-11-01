//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static let secondsInAMinute = 60
    static let hardnessDict = [
        "Soft": 1 * secondsInAMinute,
        "Medium": 7 * secondsInAMinute,
        "Hard": 12 * secondsInAMinute,
    ]
    
    var timer: Timer?
    var secondsRemaining = 0
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func hardenessSelected(_ sender: UIButton) {
        if(timer != nil) {
            timer!.invalidate()
        }

        secondsRemaining = ViewController.hardnessDict[sender.currentTitle!] ?? 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
    }
    
    @objc func startTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining)")
            secondsRemaining -= 1
        } else {
            label.text = "Done!"
            timer!.invalidate()
        }
    }
}
