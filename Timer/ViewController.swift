//
//  ViewController.swift
//  Timer
//
//  Created by Supakornbabe on 9/25/2560 BE.
//  Copyright © 2560 Supakornbabe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LapsTime: UITextView!
    @IBOutlet weak var People: UILabel!
    @IBOutlet weak var Hours: UILabel!
    @IBOutlet weak var Minute: UILabel!
    @IBOutlet weak var Second: UILabel!
    var timer = Timer()
    var countSeconds = 0
    var countMinutes = 0
    var countHours = 0
    var isRunning = false
    var stringToAppend = ""
    var numberOfPeople = 0
    
    @IBAction func Stop(_ sender: UIButton) {
        isRunning = false
        countSeconds = 0
        countMinutes = 0
        countHours = 0
        Second.text = String(format:"%02d",countSeconds)
        Minute.text = String(format:"%02d",countMinutes)
        Hours.text = String(format:"%02d",countHours)
        People.text = "0"
        
    }
    @IBAction func Start(_ sender: UIButton) {
        isRunning = true
        runTimer()
    }
    @IBAction func Lap(_ sender: UIButton) {
        numberOfPeople += 1
        People.text = String(numberOfPeople)
        LapsTime.text =  LapsTime.text! + stringToAppend
    }
    
    
    
    func runTimer() {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,
                                         selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func updateTimer(){
        if(isRunning){
            countSeconds += 1
        }
        
        if(countSeconds == 60){
            countMinutes += 1
            countSeconds = 0
        }
        
        if(countMinutes == 60){
            countHours += 1
            countMinutes = 0
        }
        Second.text = String(format:"%02d",countSeconds)
        Minute.text = String(format:"%02d",countMinutes)
        Hours.text = String(format:"%02d",countHours)
        
        stringToAppend = String(format:"%02d:%02d:%02d\n",countHours,countMinutes,countSeconds)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        LapsTime.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

