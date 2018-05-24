//
//  CloudKitSchemas.swift
//  Picojot
//
//  Created by Jibran Syed on 4/24/18.
//  Copyright © 2018 Jishenaz. All rights reserved.
//

import Foundation


enum JotSchema
{
    static let RecordName = "Jot"
    static let Title = "jotTitle"
    static let ColorTagId = "jotTagId"
    static let BodyText = "jotBody"
}


enum ColorTagSchema
{
    static let RecordName = "ColorTag"
    static let Name = "tagName"
    static let ColorRed = "tagRedValue"
    static let ColorGreen = "tagGreenValue"
    static let ColorBlue = "tagBlueValue"
}


// Temporary RAM storage until I get Core Data working

struct TempJot
{
    var title: String
    var colorTagId: String
    var bodyText: String
}

struct TempColorTag
{
    var id: String
    var name: String
    var colorRed: Double
    var colorGreen: Double
    var colorBlue: Double
}


let global_tempTags: [TempColorTag] = [
    TempColorTag(id: "blue", name: "Personal", colorRed: 0.0, colorGreen: 0.3, colorBlue: 1.0),
    TempColorTag(id: "red", name: "Important", colorRed: 1.0, colorGreen: 0.0, colorBlue: 0.1),
    TempColorTag(id: "green", name: "Remove Later", colorRed: 0.0, colorGreen: 0.7, colorBlue: 0.1),
    TempColorTag(id: "black", name: "Other Long fjsdlfjsdkl", colorRed: 0.25, colorGreen: 0.25, colorBlue: 0.25)
]

let global_tempJots: [TempJot] = [
    TempJot(title: "Test 1", colorTagId: "blue", bodyText: "This is my first jot! Hello iOS"),
    TempJot(title: "Do Tomorrow", colorTagId: "red", bodyText: "Go travel the world"),
    TempJot(title: "Interesting Quote skdjflkasdjfklasdfjlksd", colorTagId: "green", bodyText: "You are what you absorb."),
    TempJot(title: "Test 2", colorTagId: "black", bodyText: "Yet another test note with random letters and numbers 3 4 02 0503 039 0320 9590 0 834"),
    TempJot(title: "Where to go", colorTagId: "blue", bodyText: "London, Berlin, Kyoto, Makkah, Istanbul, Shanghai"),
    TempJot(title: "Test 3", colorTagId: "red", bodyText: "This jot is very important")
]



