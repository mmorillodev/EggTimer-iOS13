//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let hardnessDict = [
        "Soft": 5,
        "Medium": 7,
        "Hard": 12,
    ]

    @IBAction func hardenessSelected(_ sender: UIButton) {
        print(hardnessDict[sender.titleLabel!.text!] ?? "Not found")
    }
    
}
