//
//  ConverterViewController.swift
//  TabbyExample
//
//  Created by Tyron Allen on 10/29/14.
//  Copyright (c) 2014 Tyron Allen. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    
    @IBOutlet weak var farenheitLabel: UILabel!
    @IBOutlet weak var celsiusText: UITextField!
    
    @IBAction func convertDegree(sender: AnyObject) {
        
        var cToF = (celsiusText.text as NSString).floatValue
        farenheitLabel.text = String(format: "%0.2f", cToF * 1.8 + 32)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
