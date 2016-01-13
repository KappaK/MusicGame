//
//  ViewController.swift
//  MusicGame
//
//  Created by Rayne on 12/2/15.
//  Copyright (c) 2015 Kappa. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var hanteiLabel: UILabel!
    
    var count: Float = 0.0
    var timer: NSTimer = NSTimer()
    
    var speed: Float = 0.0
    var targetLabel: UILabel = UILabel()
    
    var audio: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if !timer.valid {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("up"), userInfo: nil, repeats: true)
        }
    
        targetLabel = UILabel(frame: CGRectMake(0, 0, 50, 50))
        targetLabel.text = ""
        targetLabel.font = UIFont.systemFontOfSize(50)
        targetLabel.backgroundColor = UIColor.clearColor()
        self.view.addSubview(targetLabel)
        
        let appframe: CGRect = UIScreen.mainScreen().bounds
        speed = Float(appframe.size.height) / 1.2
        
        if let audioPath = NSBundle.mainBundle().URLForResource("music", withExtension: "mp3") {
            do {
            audio = try AVAudioPlayer(contentsOfURL: audioPath)
            audio.play()
        } catch {
                fatalError("Player has failed!")
            }
        } else {
            fatalError("No value in audioPath.")
        }
    
        
    }
    
    func up() {
        count = count + 0.01
        timeLabel.text = String(format:"%.2f" , count)
        
        if 10.0 - 1.2 <= count {
            targetLabel.text = " "
            let appframe: CGRect = UIScreen.mainScreen().bounds
            let x = appframe.size.width / 2 - 25
            let y = CGFloat((count - 10.0 + 1.2) * speed - 75)
            targetLabel.frame = CGRectMake(x, y, 50, 50)
        }
    }
    
    func hantei(number: Float) -> String {
    
    if count > number - 0.20 && count < number + 0.20 {
        return "PERFECT"
    } else if count > number - 0.30 && count < number + 0.30 {
        return "GREAT"
    } else if count > number - 0.50 && count < number + 0.50 {
        return "GOOD"
    } else {
        return "BAD!"
    }
    
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pushButton() {
        
    }
    

}

