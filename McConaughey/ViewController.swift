//
//  ViewController.swift
//  McConaughey
//
//  Created by Kathryn Tatum on 2/10/20.
//  Copyright © 2020 Kathryn Tatum. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var matthewImage: UIImageView!
    @IBOutlet weak var matthewQuestion: UILabel!
    @IBOutlet weak var alrightLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        alrightLabel.text = ""
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        alrightLabel.text = "\(Int(stepper.value))"
    }
    

    func playSound(name: String, numberOfLoops: Int) {
           if let sound = NSDataAsset(name: name) {
               do {
                   try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.numberOfLoops = numberOfLoops
                   audioPlayer.play()
               } catch {
                   print ("ERROR: 🛑 \(error.localizedDescription) Could not initialize AVAudioPlayer object")
               }
           } else {
               print("ERROR: 🛑 Could not read data from file sound0")
           }
    
}
    
    @IBAction func messageButtonPressed(_ sender: Any) {
        playSound(name: "alright", numberOfLoops: Int(stepper.value)-1)
    }
    
}
