//
//  dashboardViewController.swift
//  Dashboard
//
//  Created by CJ Voege on 11/17/14.
//  Copyright (c) 2014 CJ Voege. All rights reserved.
//
//
//  dashbordViewController.swift
//  Dashboard
//
//  Created by Matthew Whitesides on 12/10/14.
//  Copyright (c) 2014 Matthew Whitesides. All rights reserved.
//
// TEST COMMETIRWJO

import UIKit
import HealthKit

class dashboardViewController: UIViewController, writeValueBackDelegate {

    //circle to be animated
    let shape = CAShapeLayer()
    let progress = CAShapeLayer()
    let progressLayer = CAShapeLayer()
    
    //Steps Label and progress bar animation
    var timer: NSTimer?
    var timer2: NSTimer?
    
    
    //Health Kit Stuff
    var hk = HealthKitData()
    let steps = 4000
    var dailyGoal = 6000
    let daysCompleted = 25
    let daysTotal = 30
    
    //Top Half Outlets
    @IBOutlet weak var opponetName: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamDaysWon: UILabel!
    @IBOutlet weak var teamAvgSteps: UILabel!
    @IBOutlet weak var opponetDaysWon: UILabel!
    @IBOutlet weak var opponetAvgSteps: UILabel!
    
    
    //Bottom Half Outlets
    @IBOutlet weak var avgStepView: UIView!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var progressBarView: UIProgressView!
    @IBOutlet weak var dailyGoalLabel: UILabel!
    @IBOutlet weak var dailyGoalHiddenButton: UIButton!
    
    //Daily Goal Select
    var pickerSelect = "0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTeamLabels()
        createProgressCircle()
        initProgressBar()
        hk.queryHealthKitSteps()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initTeamLabels() {
        //Todo Health Kit 
        teamName.text = "Team Zulu"
        opponetName.text = "Columbia College CS"
        
        teamDaysWon.text = "15"
        opponetDaysWon.text = "7"
        
        teamAvgSteps.text = "4431"
        opponetAvgSteps.text = "3338"
    }
    
    override func viewDidDisappear(animated: Bool) {
        stepsLabel.text = "\(steps)"
        timer?.invalidate()
    }

    //Bottom Day Count Progress Bar
    func initProgressBar() {
        let interval = Double(8/Double(daysCompleted * daysCompleted))
        timer2 = NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: "update2", userInfo: nil, repeats: true)
    }
    
    func update2() {
        progressBarView.progress += 8.0/Float(daysCompleted * daysCompleted *  8)
        if progressBarView.progress >= Float(daysCompleted)/Float(daysTotal) {
            timer2?.invalidate()
        }
    }
    
    //Create Circle and Animation
    func createProgressCircle() {
        
        //Calculate frames bounds
        let frameWidth = circleView.frame.width
        let frameHeight = circleView.frame.height
        let lineWidth: CGFloat = 30
        let rectSize: CGFloat = 120
        
        //CIRCLE!!!
        // Customize the appearance of the shape layer
        shape.fillColor = UIColor.clearColor().CGColor
        shape.strokeColor = view.tintColor.CGColor
        shape.lineWidth = lineWidth
        
        // Make a rect to draw our shape in
        let rect = CGRectMake(0, 0, rectSize, rectSize)
        
        // Set the offset for the shape layer
//        let offsetX = ((frameWidth/2) - (rectSize) + 10)
//        let offsetY = (frameHeight/2)
        let offsetX: CGFloat = 190.0
        let offsetY: CGFloat = 142.0
        
        //Set the progress of the animation
        let start = CGFloat(-1.57079637050629)
        let precentageDone = Float(steps) / Float(dailyGoal)
        let end = DegreesToRadians((360 * precentageDone) - 90)
        
        //Note the offsets are completely not dynamic and work mainly on iPhone 6
        var path = UIBezierPath(arcCenter: CGPointMake(offsetX, offsetY), radius: rectSize as CGFloat, startAngle: start, endAngle: end , clockwise: true)
        
        
        // Add the shape layer as a sub layer of our view
        circleView.layer.addSublayer(shape)
        
        //Shape Constraints
        shape.frame = self.circleView.layer.frame
        
        // Inner arc
        progress.fillColor = UIColor.clearColor().CGColor
        progress.strokeColor = UIColor.orangeColor().CGColor
        progress.lineWidth = shape.lineWidth
        progress.path = path.CGPath
        //fill in our circle
        circleView.layer.addSublayer(progress)
        
        animatCircle()
        
        //Label Animation
        let interval = Double(8/steps)
        timer = NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: "update", userInfo: nil, repeats: true)
    }
    
    //Number counting function
    @IBOutlet weak var stepsLabel: UILabel!
    func update() {
        if var stepNum = stepsLabel.text?.toInt() {
            if stepNum <= steps {
                stepNum = stepNum + 1
                stepsLabel.text = "\(stepNum)"
                if stepNum == steps {
                    timer?.invalidate()
                }
            }
        } else {
            timer?.invalidate()
        }
    }
    
    func animatCircle() {
        // Animate the shape change
        //let duration = NSNumber(float: 2.0)
        var newAnimation = CABasicAnimation(keyPath: "strokeEnd")
        newAnimation.duration = 8.0
        newAnimation.removedOnCompletion = false
        newAnimation.fromValue = NSNumber(float: 0)
        newAnimation.toValue = NSNumber(float: 1.0)
        newAnimation.delegate = self
        newAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        progress.addAnimation(newAnimation, forKey: "strokeEnd Animation")
    }
    
    //function that converts degrees to radians
    func DegreesToRadians (value:Float) -> CGFloat {
        return CGFloat(value * Float(M_PI) / 180.0)
    }
    
    @IBAction func hiddenButtonClicked(sender: AnyObject) {
        var stepPickerView = DailyStepGoalViewController(nibName: "DailyStepGoalViewController", bundle: nil)
        navigationController?.pushViewController(stepPickerView, animated: true )
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "dailyStepCountSegue" {
            var stepGoalVC = segue.destinationViewController.visibleViewController as DailyStepGoalViewController
            stepGoalVC.delegate = self
        }
    }
    
    //Called when daily step goal changes pickerview
    func writeValueBack(value: Int) {
        dailyGoalLabel.text = "Daily Goal: \(value)"
        dailyGoal = value
        circleView.layer.removeAllAnimations()
        progress.removeAllAnimations()
        createProgressCircle()
    }

}
