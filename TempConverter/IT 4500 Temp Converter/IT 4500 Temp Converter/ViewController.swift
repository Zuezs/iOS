//
//  ViewController.swift
//  IT 4500 Temp Converter
//
//  Created by Tyron Allen on 10/21/14.
//  Copyright (c) 2014 Tyron Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var cDegree: UILabel!
    @IBOutlet weak var fDegree: UILabel!
    @IBOutlet weak var farenheit_label: UILabel!
    @IBOutlet weak var celsius_text: UITextField!
    
   @IBAction func Convert(sender: AnyObject) {
        
        var f = (celsius_text.text as NSString).floatValue
        farenheit_label.text = String(format: "%0.2f", f * 1.8 + 32)
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

