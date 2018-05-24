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
    
}
