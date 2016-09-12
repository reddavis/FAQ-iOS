//
//  FAQSection.swift
//  FAQ
//
//  Created by Red Davis on 29/07/2016.
//  Copyright © 2016 GVL. All rights reserved.
//

import Foundation


internal struct FAQSection
{
    /**
     ActionType
     
     - navigation: Will push a table view controller
     - web:        Will push a web view controller
     */
    internal enum ActionType: String
    {
        case navigation = "navigation"
        case web = "web"
    }
    
    internal enum Error: ErrorType
    {
        case invalidData(data: [String : AnyObject])
    }
    
    // Internal
    internal let title: String
    internal let actionType: ActionType
    internal let identifier: String?
    internal var viewController: UIViewController!
    internal var sections: [FAQSection]?
    internal var URL: NSURL?
    
    // Private
    
    // MARK: Initialization
    
    internal init(data: [String : AnyObject]) throws
    {
        guard let title = data["title"] as? String,
            let actionTypeString = data["actionType"] as? String,
            let actionType = ActionType(rawValue: actionTypeString) else
        {
            throw Error.invalidData(data: data)
        }
        
        self.title = title
        self.actionType = actionType
        self.identifier = data["identifier"] as? String
        
        // Section data or URL
        switch self.actionType
        {
        case .web:
            guard let URLString = data["data"] as? String,
                let URL = NSURL(string: URLString) else
            {
                throw Error.invalidData(data: data)
            }
            
            self.URL = URL
            self.viewController = FAQSectionWebViewController(section: self)
        case .navigation:
            guard let sectionsData = data["data"] as? [[String : AnyObject]] else
            {
                throw Error.invalidData(data: data)
            }
            
            var sections = [FAQSection]()
            for sectionData in sectionsData
            {
                let section = try FAQSection(data: sectionData)
                sections.append(section)
            }
            
            self.sections = sections
            self.viewController = FAQSectionTableViewController(section: self)
        }
    }
}
