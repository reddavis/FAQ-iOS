//
//  FAQSectionViewController.swift
//  FAQ
//
//  Created by Red Davis on 29/07/2016.
//  Copyright © 2016 GVL. All rights reserved.
//

import UIKit


internal final class FAQSectionTableViewController: UIViewController, UITableViewDataSource,
                                                    UITableViewDelegate
{
    // Private
    private let section: FAQSection!
    
    private let tableView = UITableView(frame: CGRect.zero, style: .Grouped)
    
    // MARK: Initialization
    
    internal required init(section: FAQSection)
    {
        self.section = section
        super.init(nibName: nil, bundle: nil)
        self.title = section.title
    }
    
    internal required init?(coder aDecoder: NSCoder)
    {
        self.section = nil
        super.init(coder: aDecoder)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Tableview
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(self.tableView)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
        let bounds = self.view.bounds
        self.tableView.frame = bounds
    }
    
    // MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.section.sections!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cellIdentifier = "defaultCell"
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        
        if cell == nil
        {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
        }
        
        let rowSection = self.section.sections![indexPath.row]
        cell.textLabel?.text = rowSection.title
        cell.accessibilityLabel = rowSection.title
        cell.accessoryType = .DisclosureIndicator
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let section = self.section.sections![indexPath.row]
        self.navigationController?.pushViewController(section.viewController, animated: true)
    }
}
