//
//  CloudKitHelper.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/3/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import Foundation
import UIKit
import CloudKit

class CloudKitHelper {
   
    var container : CKContainer
    var publicDB : CKDatabase
    let privateDB : CKDatabase
    var error: Bool = false
    
    init() {
        container = CKContainer.defaultContainer()
        publicDB = container.publicCloudDatabase
        privateDB = container.privateCloudDatabase
    }
    
    func checkForICloud() -> Bool {
        if let token = NSFileManager.defaultManager().ubiquityIdentityToken {
            return true
        } else {
            return false
        }
    }

    
    func saveRecord(record : NSString, tableName : NSString, forKey : NSString, isPrivate: Bool) {
        let todoRecord = CKRecord(recordType: tableName)
        todoRecord.setValue(record, forKey: forKey)
        if isPrivate {
            privateDB.saveRecord(todoRecord, completionHandler: { (record, error) -> Void in
                if error != nil {
                    println("There was an error \(error.description)!")
                } else {
                    NSLog("Saved to cloud kit \(record)")
                }
            })
        } else {
            publicDB.saveRecord(todoRecord, completionHandler: { (record, error) -> Void in
                if error != nil {
                    println("There was an error \(error.description)!")
                } else {
                    NSLog("Saved to cloud kit \(record)")
                }
            })
        }
    }
    
    func saveRecord(records : NSDictionary, tableName : NSString, forKey : NSString, isPrivate: Bool) {
        let todoRecord = CKRecord(recordType: tableName)
        
        for record in records {
            todoRecord.setValue(record.value, forKey: record.key as NSString)
        }
        
        if isPrivate {
            privateDB.saveRecord(todoRecord, completionHandler: { (record, error) -> Void in
                if error != nil {
                    println("There was an error \(error.description)!")
                } else {
                    NSLog("Saved to cloud kit \(record)")
                }
            })
        } else {
            publicDB.saveRecord(todoRecord, completionHandler: { (record, error) -> Void in
                if error != nil {
                    println("There was an error \(error.description)!")
                } else {
                    NSLog("Saved to cloud kit \(record)")
                }
            })
        }
    }
    
    func retriveRecords(sortKey: NSString, queryRecordType: NSString, completionHandler: ([AnyObject] -> Void)) -> AnyObject {
        let predicate = NSPredicate(value: true)
        let sort = NSSortDescriptor(key: sortKey, ascending: false)
        var queryRecord : AnyObject?
        var queryError : AnyObject?
        
        let query = CKQuery(recordType: queryRecordType, predicate: predicate)
        query.sortDescriptors = [sort]
    
        publicDB.performQuery(query, inZoneWithID: nil, completionHandler: { (records: [AnyObject]!, error: NSError!) -> Void in
            if error != nil {
                NSLog("Error \(error)")
                queryError = error
                self.error = true
                return
            } else {
                completionHandler(records)
                return
            }
        })
    
        
        if queryRecord != nil {
            self.error = false
            return queryRecord!
        }
        if queryError != nil {
            self.error = true
            return queryError!
        }
        return "Error"
    }
}
