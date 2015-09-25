//
//  LoginViewController.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/7/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        submitButton.sendActionsForControlEvents(UIControlEvents.TouchUpInside)
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //Text Field Styling
        self.inputTextField.layer.borderColor = UIColor.whiteColor().CGColor
        self.inputTextField.layer.borderWidth = 2.0
        self.inputTextField.layer.cornerRadius = (self.inputTextField.frame.height/2)

        //Submit Button Styling
        self.submitButton.layer.borderColor = UIColor(red: (244/255), green: (67/255), blue: (54/255), alpha: 1.0).CGColor
        self.submitButton.layer.cornerRadius = (self.submitButton.frame.height/2)
        
        inputTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
