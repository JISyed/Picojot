//
//  JotListingViewController.swift
//  Picojot
//
//  Created by Jibran Syed on 4/11/18.
//  Copyright © 2018 Jishenaz. All rights reserved.
//

import UIKit
import CloudKit

class JotListingViewController: UIViewController 
{
    @IBOutlet weak var jotsTable: UITableView!
    
    
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    
    
    @IBAction func onAddBtnPressed(_ sender: Any) 
    {
        print("Add")
        
    }
    
    
    @IBAction func onTagsBtnPressed(_ sender: Any) 
    {
        print("Tags")
    }
    
    
    
}

