//
//  CloudKitService.swift
//  Picojot
//
//  Created by Jibran Syed on 5/3/18.
//  Copyright © 2018 Jishenaz. All rights reserved.
//

import Foundation
import CloudKit

class CloudKitService
{
    private static let inst = CloudKitService()
    private init()
    {
        
    }
    
    private let privateDB = CKContainer.default().privateCloudDatabase
    private let _jots : [TempJot] = []
    
    
    static var jots : [TempJot] 
    {
        get
        {
            return inst._jots
        }
    }
    
    static func makeNewJot(withTitle title: String, andBody body: String)
    {
        let newJot = TempJot(title: title, colorTagId: "", bodyText: body)
        let newRecord = CKRecord(recordType: JotSchema.RecordName)
        newRecord.setValue(newJot.title, forKey: JotSchema.Title)
        newRecord.setValue(newJot.colorTagId, forKey: JotSchema.ColorTagId)
        newRecord.setValue(newJot.bodyText, forKey: JotSchema.BodyText)
        
        CloudKitService.inst.privateDB.save(newRecord) { (returnedRecord, error) in
            if let err = error
            {
                debugPrint("Jot creation error!")
                debugPrint(err)
                return
            }
            
            guard returnedRecord != nil else
            {
                debugPrint("Jot creation return error! Record nil!")
                return
            }
            
            print("New jot created successfully")
            
        }
    }
    
    static func loadAllJots()
    {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: JotSchema.RecordName, predicate: predicate)
        inst.privateDB.perform(query, inZoneWith: nil) { (records, error) in
            if let err = error
            {
                print("Jots could not be fetched from iCloud!")
                debugPrint(err)
                return
            }
            guard let allRecords = records else {
                print("Jots records are nil!")
                return
            }
            
            
        }
    }
    
    static func setupSubscription()
    {
        
    }
    
    
    
}
