// Playground - noun: a place where people can play

import UIKit

let viewRect = CGRect(x: 0.0, y: 0.0, width: 480.0, height: 480.0)
let view = UIView(frame: viewRect)
view.backgroundColor = UIColor(red:240.0, green:230.0, blue: 242.0, alpha:1.0)
let subView = UIView(frame: CGRectZero)
subView.setTranslatesAutoresizingMaskIntoConstraints(false)
subView.backgroundColor = UIColor.greenColor()

view.addSubview(subView)

let subViewTopConstraint = NSLayoutConstraint(item: subView, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 20.0)

let subViewRightConstraint = NSLayoutConstraint(item: subView, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1.0, constant: -16.0)

let subViewBottomConstraint = NSLayoutConstraint(item: subView, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: -10.0)

let subViewLeftConstraint = NSLayoutConstraint(item: subView, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1.0, constant: 16.0)


let blueView = UIView(frame: CGRectZero)
blueView.setTranslatesAutoresizingMaskIntoConstraints(false)
blueView.backgroundColor = UIColor.blueColor()

let orangeView = UIView(frame: CGRectZero)
orangeView.setTranslatesAutoresizingMaskIntoConstraints(false)
orangeView.backgroundColor = UIColor.orangeColor()

let yellowView = UIView(frame: CGRectZero)
yellowView.setTranslatesAutoresizingMaskIntoConstraints(false)
yellowView.backgroundColor = UIColor.yellowColor()

subView.addSubview(blueView)
subView.addSubview(orangeView)
subView.addSubview(yellowView)

let orangeViewTop = NSLayoutConstraint(item: orangeView, attribute: .Top, relatedBy: .Equal, toItem: subView, attribute: .Top, multiplier: 1.0, constant: 10.0)


let orangeViewRight = NSLayoutConstraint(item: orangeView, attribute: .Right, relatedBy: .Equal, toItem: subView, attribute: .Right, multiplier: 1.0, constant: -10.0)


let orangeViewBottom = NSLayoutConstraint(item: orangeView, attribute: .Bottom, relatedBy: .Equal, toItem: subView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: -3.0)


let orangeViewLeft = NSLayoutConstraint(item: orangeView, attribute: .Left, relatedBy: .Equal, toItem: subView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: -3.0)



let blueViewTop = NSLayoutConstraint(item: blueView, attribute: .Top, relatedBy: .Equal, toItem: subView, attribute: .Top, multiplier: 1.0, constant: 10.0)

let blueViewRight = NSLayoutConstraint(item: blueView, attribute: .Right, relatedBy: .Equal, toItem: orangeView, attribute: .Left, multiplier: 1.0, constant: -6.0)

let blueViewBottom = NSLayoutConstraint(item: blueView, attribute: .Bottom, relatedBy: .Equal, toItem: subView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: -3.0)

let blueViewLeft = NSLayoutConstraint(item: blueView, attribute: .Left, relatedBy: .Equal, toItem: subView, attribute: .Left, multiplier: 1.0, constant: 10.0)

let yellowViewTop = NSLayoutConstraint(item: yellowView, attribute: .Top, relatedBy: .Equal, toItem: subView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 3.0)

let yellowViewRight = NSLayoutConstraint(item: yellowView, attribute: .Right, relatedBy: .Equal, toItem: subView, attribute: .Right, multiplier: 1.0, constant: -10.0)

let yellowViewBottom = NSLayoutConstraint(item: yellowView, attribute: .Bottom, relatedBy: .Equal, toItem: subView, attribute: .Bottom, multiplier: 1.0, constant: -10.0)

let yellowViewLeft = NSLayoutConstraint(item: yellowView, attribute: .Left, relatedBy: .Equal, toItem: subView, attribute: .Left, multiplier: 1.0, constant: 10.0)




var subConstraints = [subViewTopConstraint, subViewRightConstraint, subViewBottomConstraint, subViewLeftConstraint, orangeViewTop, orangeViewRight, orangeViewBottom, orangeViewLeft, blueViewTop, blueViewRight, blueViewBottom, blueViewLeft, yellowViewTop, yellowViewRight, yellowViewBottom, yellowViewLeft]



view.addConstraints(subConstraints)
view.layoutIfNeeded()
view



