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
    static let STRYBRD_ID = "JotListingVC"
    
    @IBOutlet weak var jotsTable: UITableView!
    
    
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.jotsTable.delegate = self
        self.jotsTable.dataSource = self
        
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

extension JotListingViewController: UITableViewDelegate
{
}

extension JotListingViewController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int 
    {
        if global_tempJots.count == 0
        {
            let emptyTableLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            emptyTableLabel.text = "Tap ＋ To Add A New Jot"
            emptyTableLabel.textAlignment = .center
            emptyTableLabel.textColor = UIColor.white
            emptyTableLabel.numberOfLines = 0
            emptyTableLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.title2)
            emptyTableLabel.sizeToFit()
            tableView.backgroundView = emptyTableLabel
            tableView.separatorStyle = .none
            
            return 1
        }
        
        tableView.backgroundView = nil
        tableView.separatorStyle = .singleLine
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
    {
        return global_tempJots.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: JotCell.ID) as? JotCell else {return UITableViewCell()}
        
        let jot = global_tempJots[indexPath.row]
        
        cell.setupCell(withJot: jot)
        
        return cell
    }
    
    
    
    // Allows table cells to be editable
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool 
    {
        return false    // TODO: CHANGE TO TRUE if you want to edit
    }
    
    // No edit icons (unswiped)
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle 
    {
        return UITableViewCellEditingStyle.none
    }
    
    
    
    
}
