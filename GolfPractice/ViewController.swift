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
    
    var timer = Timer()
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 6, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func resetTimer() {
        timer.invalidate()
        runTimer()
    }
    
    func updateTimer() {
        generateShot()
    }
    
    @IBOutlet weak var clubsDisplay: UILabel!
    @IBOutlet weak var shotShapeDisplay: UILabel!
    @IBOutlet weak var shotTrajectoryDisplay: UILabel!
    @IBAction func generateButton(_ sender: UIButton) {
        resetTimer()
        generateShot()
    }
    
    func generateShot() {
        clubsDisplay.text = clubs.randomElement()
        shotShapeDisplay.text = shotShape.randomElement()
        shotTrajectoryDisplay.text = shotTrajectory.randomElement()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()
    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

}

