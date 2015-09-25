//
//  User.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/6/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit
import CloudKit
import Foundation

class User {
    
    var cKit: CloudKitHelper = CloudKitHelper()
    
    init() {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "User", predicate: predicate)
        let sort = NSSortDescriptor(key: "Name", ascending: false)

        cKit.privateDB.performQuery(query, inZoneWithID: nil, completionHandler: { (record, error) -> Void in
            if error != nil {
                NSLog("Error \(error)")
            } else {
                NSLog("Got Record \(record)")
//                if let team = {
//                    println("Cool")
//                }
                let records: [NSString : NSString] = ["Name": "DudeBrah", "Team": "No Team"]
                self.cKit.saveRecord(records, tableName: "User", forKey: "Team", isPrivate: true)
            }
        })
    }
    
}
