//
//  ViewController.swift
//  DatePicker
//
//  Created by Seobin Nam on 10/14/17.
//  Copyright © 2017 Seobin Nam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //TIMER
    
    //updatetime function does not exist in ViewController Class will create the function
    let timeSelector: Selector = #selector(ViewController.updateTime)
    //Time interval
    let interval = 1.0
    var count = 0
    
    var alarmTime: String?
    
    //LAYOUT
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set up the timer
        //selector takes function when timer operates run
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender;
        
        //A formatter that converts between dates and their textual representations.
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy HH:mm:ss EEE"
        lblPickerTime.text = "Picker Time: " + formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    //updateTime function for timer
    @objc func updateTime() {
//        lblCurrentTime.text = String(count)
//        count = count + 1
        
        //NSDate() function provides current time.
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy HH:mm:ss EEE"
        lblCurrentTime.text = "Current Time: " + formatter.string(from: date as Date)
    
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        
        if (alarmTime == currentTime) {
            view.backgroundColor = UIColor.red
        }
        else {
            view.backgroundColor = UIColor.white
        }
    }
    
}

