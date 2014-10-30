// Playground - noun: a place where people can play

import UIKit

let viewRect = CGRect(x: 0.0, y: 0.0, width: 320.0, height: 480.0)
let view = UIView(frame: viewRect)
view.backgroundColor = UIColor.lightGrayColor()

let redView = UIView(frame: CGRectZero)
redView.setTranslatesAutoresizingMaskIntoConstraints(false)
redView.backgroundColor = UIColor.redColor()

let yellowView = UIView(frame: CGRectZero)
yellowView.setTranslatesAutoresizingMaskIntoConstraints(false)
yellowView.backgroundColor = UIColor.yellowColor()

view.addSubview(redView)
view.addSubview(yellowView)

let redViewTopConstraint = NSLayoutConstraint(item: redView, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 20.0)

let redViewRightConstraint = NSLayoutConstraint(item: redView, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1.0, constant: -20.0)

let redViewLeftConstraint = NSLayoutConstraint(item: redView, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1.0, constant: 20.0)

let redViewBottomConstraint = NSLayoutConstraint(item: redView, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 10.0)


let yellowViewBottomConstraint = NSLayoutConstraint(item: yellowView, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: -20.0)

let yellowViewRightConstraint = NSLayoutConstraint(item: yellowView, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1.0, constant: 0.0)

let yellowViewLeftConstraint = NSLayoutConstraint(item: yellowView, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1.0, constant: 0.0)

let yellowViewTopConstraint = NSLayoutConstraint(item: yellowView, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 10.0)

var constraints = [redViewTopConstraint, redViewRightConstraint, redViewLeftConstraint, redViewBottomConstraint, yellowViewBottomConstraint, yellowViewRightConstraint, yellowViewLeftConstraint, yellowViewTopConstraint]

view.addConstraints(constraints)
view.layoutIfNeeded()
view







