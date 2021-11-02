//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    static let secondsInAMinute = 60
    static let hardnessDict = [
        "Soft": 5 * secondsInAMinute,
        "Medium": 7 * secondsInAMinute,
        "Hard": 12 * secondsInAMinute,
    ]
    
    var timer: Timer?
    var secondsRemaining = 0
    var totalSeconds = 0
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var passedTime: UIProgressView!
    
    @IBAction func hardenessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        resetItems(hardness: hardness)
        
        totalSeconds = ViewController.hardnessDict[hardness] ?? 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
    }
    
    @objc func startTimer() {
        if secondsRemaining <= totalSeconds {
            let computedProgress = Float(secondsRemaining) / Float(totalSeconds)
            secondsRemaining += 1
                        
            passedTime.setProgress(computedProgress, animated: true)
        } else {
            terminateTimer()
        }
    }
    
    func resetItems(hardness: String) {
        label.text = "How do you like your eggs?"
        passedTime.setProgress(0, animated: false)
        secondsRemaining = 0
        
        if(timer != nil) {
            timer!.invalidate()
        }
    }
    
    func terminateTimer() {
        label.text = "Done!"
        timer!.invalidate()
        playSound()
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        let player = try? AVAudioPlayer(contentsOf: url!)
        
        player!.play()
    }
}
