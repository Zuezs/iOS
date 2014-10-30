//
//  YellowViewController.swift
//  AppDelegate
//
//  Created by Tyron Allen on 9/18/14.
//  Copyright (c) 2014 Tyron Allen. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController{
    
    let textField = UITextField(frame: CGRectZero)
    let button = UIButton(frame: CGRectZero)
    
    var textFieldConstraints:[NSLayoutConstraint]?
    var buttonConstraints:[NSLayoutConstraint] {
        let constraintArray = [NSLayoutConstraint]()
            return constraintArray
    }
    
    
    
    override func loadView() {
        
            view = UIView(frame: CGRectZero)
            view.backgroundColor = UIColor.yellowColor()
            view.addSubview(textField)
            view.addSubview(button)
            
        }

    
    
}
