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
        
        pageIdentifiers = ["PageA", "PageB", "PageC", "PageD"]
        
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
    
    // UIPageViewController delegate methods
    
    func pageViewController(pageViewController: UIPageViewController, spineLocationForInterfaceOrientation orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        // Set the spine position to "min" and the page view controllers view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to true, so set it to false here.
        
        let currentViewController = pageViewController.viewControllers[0] as UIViewController
        let viewControllers: NSArray = [currentViewController]
        pageViewController.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: {done in })
        
        pageViewController.doubleSided = false
        return .Min
    }
    
    //UIPageViewController data source methods
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        //Get the index position in the pages array for the current page to know what the next page should be.
        let indexPosition = indexPositionForCurrentPage(pageViewController)
        //If the indexPosition is -1 then the current page wasn't found and we cannot do anything about stating what the next page should be.
        
        if (indexPosition == -1){
            return nil
        }
        
        //Get the previous index position in the pages array by subtracting 1
        var prevIndexPosition = indexPosition - 1
        //Decide what to do if the index postion goes beyond the beginning of the pages array.
        if(prevIndexPosition < 0){
            if(loopPages){
                //If looping then go to the end of the array.
                
                prevIndexPosition = pages.count - 1
            }else{
                // Otherwise, we are at the beginning and cant go further
                return nil
                
            }
        }
        
        //Return the previous page
        return pages[prevIndexPosition]
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        //Get the index position in the pages array for the current page to know what the next page should be
        let indexPosition = indexPositionForCurrentPage(pageViewController)
        //If the indexPosition is -1 then the current page wasnt found and we cant do anything about stating what the enxt page should be.
        if(indexPosition == -1){
            return nil
        }
        
        //Get the next index position in the pages array by adding 1
        var nextIndexPosition = indexPosition + 1
        //Decide what to do if the index position goes beyond the end of the pages array
        if (nextIndexPosition > pages.count - 1){
            if( loopPages){
                //If looping then go back to the beginning of the array
                nextIndexPosition = 0
            }else{
                //Otherwise we are at the end and cant go further
                return nil
            }
        }
        
        // Return the enxt page.
        return pages[nextIndexPosition]
    }
    
    // Support method
    
    func indexPositionForCurrentPage(pageViewController: UIPageViewController) -> Int{
        // Get the current view controller from the pageViewController
        let currentViewController = pageViewController.viewControllers[0] as UIViewController
        // Look through the array of pages for the current view controller and return its position.
        for (index, page) in enumerate(pages){
            if(currentViewController == page) {
                return index
            }
        }
        //The current view controller was not found in the pages array, so retrun -1 to indicate this.
        return -1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
