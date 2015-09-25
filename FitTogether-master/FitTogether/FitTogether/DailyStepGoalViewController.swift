//
//  DailyStepGoalViewController.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/10/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit

class DailyStepGoalViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {
    @IBOutlet weak var picker: UIPickerView!
    
    // delegate for dashboardViewController
    var delegate: writeValueBackDelegate?

    let pickerData = [
        "1,000", "1,500", "2,000", "2,500", "3,000",
        "3,500", "4,000", "4,500", "5,000", "5,500",
        "6,000", "6,500", "7,000", "7,500", "8,000",
        "8,500", "9,000", "9,500", "10,000"
    ]
    
    let pickerDict = [
        "1,000" : 1000, "1,500" : 1500, "2,000" : 2000,
        "2,500" : 2500, "3,000" : 3000, "3,500" : 3500,
        "4,000" : 4000, "4,500" : 4500, "5,000" : 5000,
        "5,500" : 5500, "6,000" : 6000, "6,500" : 6500,
        "7,000" : 7000, "7,500" : 7500, "8,000" : 8000,
        "8,500" : 8500, "9,000" : 9000, "9,500" : 9500,
        "10,000" : 10000
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.dataSource = self;
        self.picker.delegate = self;
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[row]
        var myTitle = NSAttributedString(string: titleData, attributes: [NSForegroundColorAttributeName:UIColor.orangeColor()])
        return myTitle
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let key = pickerData[row]
        if let value = pickerDict[key] {
            delegate?.writeValueBack(value)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var svc = segue.destinationViewController as dashboardViewController;
    }
    
}
