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

    let clubs = ["Driver", "3 wood", "5 wood", "4 hybrid", "4 iron", "5 iron", "6 iron", "7 iron", "8 iron", "9 iron", "PW", "SW", "LW"]
    let shotShape = ["Baby Fade", "Fade", "Baby Draw", "Draw", "Slice", "Hook", "Straight"]
    let shotTrajectory = ["High", "Low", "Medium"]
    
    var time = 10;
    var timer = Timer()
    
    @IBOutlet weak var clubsDisplay: UILabel!
    @IBOutlet weak var shotShapeDisplay: UILabel!
    @IBOutlet weak var shotTrajectoryDisplay: UILabel!
    @IBOutlet weak var clubsLockSwitch: UISwitch!
    @IBOutlet weak var shotTrajectoryImage: UIImageView!
    @IBOutlet weak var shotShapeImage: UIImageView!
    
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
        clubsLockSwitch.transform = CGAffineTransform(scaleX: 0.70, y: 0.70)
        super.viewDidLoad()
        generateShot()
        runTimer()
    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

}

