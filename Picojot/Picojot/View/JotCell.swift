//
//  JotCell.swift
//  Picojot
//
//  Created by Jibran Syed on 4/24/18.
//  Copyright © 2018 Jishenaz. All rights reserved.
//

import UIKit

class JotCell: UITableViewCell 
{
    static let ID = "JotCell"
    
    @IBOutlet weak var viewJotColor: UIView!
    @IBOutlet weak var lblJotTitle: UILabel!
    @IBOutlet weak var lblJotBodyText: UILabel!
    @IBOutlet weak var lblJotTagName: UILabel!
    
    private var _jot: TempJot!
    private var _colorTag: TempColorTag? = nil
    
    func setupCell(withJot jot: TempJot)
    {
        self._jot = jot
        
        self.lblJotTagName.clipsToBounds = true
        self.lblJotTagName.layer.cornerRadius = 3.0
        
        // Search every tag for the ID provided by the jot
        for tag in global_tempTags
        {
            if jot.colorTagId == tag.id
            {
                let tagColor = UIColor(red: CGFloat(tag.colorRed), green: CGFloat(tag.colorGreen), blue: CGFloat(tag.colorBlue), alpha: 1.0)
                self._colorTag = tag
                self.lblJotTagName.text = " \(tag.name) "
                self.lblJotTagName.backgroundColor = tagColor
                self.viewJotColor.backgroundColor = tagColor
                break;
            }
        }
        if _colorTag == nil
        {
            let blackColor = UIColor(white: 0.0, alpha: 1.0)
            self.lblJotTagName.text = " No Tag "
            self.lblJotTagName.backgroundColor = blackColor
            self.viewJotColor.backgroundColor = blackColor
        }
        
        self.lblJotTitle.text = jot.title
        self.lblJotBodyText.text = jot.bodyText
    }
    
    
}
