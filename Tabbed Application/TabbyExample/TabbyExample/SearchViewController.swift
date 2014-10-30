//
//  SearchViewController.swift
//  TabbyExample
//
//  Created by Tyron Allen on 10/28/14.
//  Copyright (c) 2014 Tyron Allen. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var searchTextBox: UITextField!
    @IBOutlet weak var searchConvert: UILabel!
    
    
    @IBAction func searchItem(sender: AnyObject) {
        
        var textToLabel = (searchTextBox.text as NSString)
        searchConvert.text = String(textToLabel)
        
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
