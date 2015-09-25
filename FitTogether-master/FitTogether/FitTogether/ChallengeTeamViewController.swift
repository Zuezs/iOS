//
//  ChallengeTeamViewController.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/10/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit

class ChallengeTeamViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerView: UIPickerView!

    let pickerSelections = [
        "2,000" : 2000, "3,000" : 3000, "5,000" : 2000,
        "10,000" : 10000, "15,000" : 15000, "20,000" : 20000,
        "25,000" : 25000, "30,000" : 30000, "35,000" : 35000,
        "40,000" : 40000, "45,000" : 45000, "50,000" : 50000
    ]
    let pickerData = [
        "2,000", "3,000", "5,000",
        "10,000", "15,000", "20,000",
        "25,000", "30,000", "35,000",
        "40,000", "45,000", "50,000"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
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
        var myTitle = NSAttributedString(string: titleData, attributes: [NSForegroundColorAttributeName:UIColor(red: 0.90, green: 0.20, blue: 0.15, alpha: 0.8)])
        return myTitle
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
