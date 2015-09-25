//
//  profileViewController.swift
//  Dashboard
//
//  Created by CJ Voege on 11/17/14.
//  Copyright (c) 2014 CJ Voege. All rights reserved.
//
// TEST COMMETIRWJO
//
//  profileViewController.swift
//  Dashboard
//
//  Created by Matthew Whitesides on 12/09/14.
//  Copyright (c) 2014 Matthew Whitesides. All rights reserved.
//
// TEST COMMETIRWJO

import UIKit

class profileViewController: UIViewController {
    
    let blueColor = UIColor(red: (33/355), green: (150/255), blue: (243/255), alpha: 0.9).CGColor
    //let orangeColor = UIColor(red: 0.90, green: 0.20, blue: 0.15, alpha: 0.8).CGColor
    
    //insert team data
    var teamData = TeamData()
    var fakeData:[(name: String, amtOfStepsWalked: String)]?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstBadgeView: UIView!
    @IBOutlet weak var secondBadgeView: UIView!
    @IBOutlet weak var thirdBadgeView: UIView!
    @IBOutlet weak var fourthBadgeView: UIView!
    
    @IBOutlet weak var teamLabel: UILabel!
    
    @IBOutlet weak var firstBadge: UIImageView!
    @IBOutlet weak var secondBadge: UIImageView!
    @IBOutlet weak var thirdBadge: UIImageView!
    @IBOutlet weak var fourthBadge: UIImageView!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        initProfilePic()
        constrainBadgeBoxes()
        fakeData = teamData.passArrayOfData()//for TeamDataViewController didSelectAtIndex
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Creates Circle and mask around profile pic
    func initProfilePic() {
        //Rounded Border
        imageView.backgroundColor = UIColor.clearColor()
        imageView.layer.cornerRadius = (imageView.frame.height/2)
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = blueColor
        imageView.layer.masksToBounds = true
    }
    
    //Dynamic constraints around bade containers
    func constrainBadgeBoxes() {
        //Calculate gray box sizes
        firstBadgeView.addConstraint(NSLayoutConstraint(item: firstBadgeView, attribute: NSLayoutAttribute.Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: (self.view.bounds.width/4)))
        secondBadgeView.addConstraint(NSLayoutConstraint(item: secondBadgeView, attribute: NSLayoutAttribute.Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: (self.view.bounds.width/4)))
        thirdBadgeView.addConstraint(NSLayoutConstraint(item: thirdBadgeView, attribute: NSLayoutAttribute.Width, relatedBy: .Equal, toItem: nil, attribute:
        .NotAnAttribute, multiplier: 1, constant: (self.view.bounds.width/4)))
        fourthBadgeView.addConstraint(NSLayoutConstraint(item: fourthBadgeView, attribute: NSLayoutAttribute.Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: (self.view.bounds.width/4)))
    }
    
    //Displays a given alert (Note: Not currently used)
    func displayAlertWithTitle(title: String, message: String){
        let controller = UIAlertController(title: title,
            message: message,
            preferredStyle: .Alert)
        
        controller.addAction(UIAlertAction(title: "OK",
            style: .Default,
            handler: nil))
        
        presentViewController(controller, animated: true, completion: nil)
        
    }
}
