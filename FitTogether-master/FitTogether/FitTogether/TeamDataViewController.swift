//
//  TeamDataViewController.swift
//  fittogethertwo
//
//  Created by Justin Schubring on 12/8/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit

class TeamDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    var teamData = TeamData()
    var fakeData:[(name: String, amtOfStepsWalked: String)]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fakeData = teamData.passArrayOfData()
        //var ckHelper = CloudKitHelper()
        //var userArray: AnyObject = ckHelper.retriveRecords("ID", queryRecordType: "Team")
        //NSLog("Elements in array: \(userArray)")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return fakeData.count
        return fakeData!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        let item = self.fakeData![indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.amtOfStepsWalked
        
        // var imageName = UIImage(named: fakeData[indexPath.row])
        var imageName = UIImage(named: "theDude.png")
        cell.imageView?.image = imageName
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //load profile
        let teamMember = self.fakeData![indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        
        let teamMemberProfile = storyboard.instantiateViewControllerWithIdentifier("profile") as profileViewController
        
        let teamMemberData = fakeData
        teamMemberProfile.fakeData = teamMemberData
        
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        self.navigationController?.pushViewController(teamMemberProfile, animated: true)
    }

    @IBAction func segmentedControl_Tapped(sender: AnyObject) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            //List users by A - Z
            fakeData = teamData.AtoZ()
            self.tableView.reloadData()
            
        case 1:
            //List users by Most Steps
            fakeData = teamData.HighToLow()
            tableView.reloadData()
        case 2:
            //List users by Least Steps
            fakeData = teamData.LowToHigh()
            tableView.reloadData()
        default:
            break
            
        }
    }
}