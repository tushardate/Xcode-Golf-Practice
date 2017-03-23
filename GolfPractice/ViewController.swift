//
//  ViewController.swift
//  GolfPractice
//
//  Created by Tushar Date on 3/20/17.
//  Copyright © 2017 Tushar Date. All rights reserved.
//

import UIKit
import Foundation

extension Array {
    
    func randomElement() -> Element  {
        return self[Int(arc4random_uniform(UInt32(self.count)))]
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var clubsDisplay: UILabel!
    @IBOutlet weak var shotShapeDisplay: UILabel!
    @IBOutlet weak var shotTrajectoryDisplay: UILabel!
    @IBOutlet weak var clubsLockSwitch: UISwitch!
    @IBOutlet weak var shotTrajectoryImage: UIImageView!
    @IBOutlet weak var shotShapeImage: UIImageView!
    
    let clubs = ["Driver", "3 wood", "5 wood", "4 hybrid", "4 iron", "5 iron", "6 iron", "7 iron", "8 iron", "9 iron", "PW", "SW", "LW"]
    let shotShape = ["Baby Fade", "Fade", "Baby Draw", "Draw", "Slice", "Hook", "Straight"]
    let shotTrajectory = ["High", "Low", "Medium"]
    
    var time = 2;
    var timer = Timer()
    
    
    let onColor  = UIColor(red:1.00, green:0.34, blue:0.42, alpha:1.0)
    let offColor = UIColor(red:0.31, green:0.87, blue:0.76, alpha:1.0)
    

    @IBAction func generateButton(_ sender: UIButton) {
        resetTimer()
        generateShot()
    }
    

    @IBAction func timeSliderValueChanged(_ sender: UISlider) {
        time = Int(sender.value)
        resetTimer()
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: Double(time), target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func resetTimer() {
        timer.invalidate()
        runTimer()
    }
    
    func updateTimer() {
        generateShot()
    }
    
    func generateShot() {
        let currShotTrajectory = shotTrajectory.randomElement()
        let currShotShape = shotShape.randomElement()
        
        if !clubsLockSwitch.isOn {
            clubsDisplay.text = clubs.randomElement()
        }
        shotShapeDisplay.text = currShotShape
        shotShapeImage.image = UIImage(named: currShotShape)
        shotTrajectoryDisplay.text = currShotTrajectory
        shotTrajectoryImage.image = UIImage(named: currShotTrajectory)
    }
    
    override func viewDidLoad() {
        clubsLockSwitch.onTintColor = onColor
        clubsLockSwitch.tintColor = offColor
        clubsLockSwitch.layer.cornerRadius = 16
        clubsLockSwitch.backgroundColor = offColor
        clubsLockSwitch.transform = CGAffineTransform(scaleX: 0.70, y: 0.70)
        
        
        super.viewDidLoad()
        generateShot()
        runTimer()
    }



}

