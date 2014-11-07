//
//  ViewController.swift
//  PageBasedChallenge
//
//  Created by Tyron Allen on 11/6/14.
//  Copyright (c) 2014 Tyron Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    
    //To Loop through pages continously A to B to C to D... etc, set loopPages to true
    //To stop on first and last pages, set to false
    
    var loopPages: Bool = true
    var myPageViewController: UIPageViewController!
    var pageIdentifiers:[String]!
    var pages:[UIViewController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Set the list of storyboard identifiers for the UIPageViewControllers that are on the storyboard that are
        //the pages that we are going to page through
        
        pageIdentifiers = ["PageA"]
        
        //Load the pages
        pages = []
        for pageIdentifier in pageIdentifiers{
            var page = self.storyboard!.instantiateViewControllerWithIdentifier(pageIdentifier) as UIViewController
            pages.append(page)
            
        }
        
        //Alternative to .Scroll is .PageCurl for transitionStyle
        myPageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        myPageViewController.delegate = self
        myPageViewController.dataSource = self
        
        let currentViewController = pages[0]
        let viewControllers: NSArray = [currentViewController]
        myPageViewController.setViewControllers(viewControllers , direction: .Forward, animated: false, completion: {done in})
        
        self.addChildViewController(self.myPageViewController)
        self.view.addSubview(self.myPageViewController.view)
        
        //Add the page view controller's gesture recognizers to the view controller's view so that the gestures are strated more easily.
        self.view.gestureRecognizers = self.myPageViewController.gestureRecognizers
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
