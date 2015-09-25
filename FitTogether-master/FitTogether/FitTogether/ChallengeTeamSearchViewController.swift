//
//  ChallengeTeamSearchViewController.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/10/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit
import CloudKit

class ChallengeTeamSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!

    var delegate: CloudKitQuery?
    
    var teams = [Team]()

    var teamData = TeamData()
    var fakeData:[(name: String, amtOfStepsWalked: String)]?
    
    var ck = CloudKitHelper()
    var ckData: AnyObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fakeData = teamData.passArrayOfData()
        
        ckData = ck.retriveRecords("Name", queryRecordType: "Team", completionHandler: { (ckData: [AnyObject]!) -> Void in
            for data: CKRecord in ckData as [CKRecord] {
                var team = Team(name: "", steps: 0)
                if let name: String = data.objectForKey("Name") as? String {
                    team.name = data.objectForKey("Name") as? String
                }
                if let steps: Int = data.objectForKey("Steps") as? Int {
                    team.steps = data.objectForKey("Steps") as? Int
                }
                self.teams.append(team)
                self.tableView.reloadData()
            }
        })
        
        loadingView.stopAnimating()
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
        return teams.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("teamCell") as UITableViewCell
        
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
    }
}