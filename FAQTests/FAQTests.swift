//
//  FAQTests.swift
//  FAQTests
//
//  Created by Red Davis on 28/07/2016.
//  Copyright © 2016 GVL. All rights reserved.
//

import XCTest
@testable import FAQ


internal class FAQTests: XCTestCase
{
    private let JSONData: [String : AnyObject] = {
        let filePath = NSBundle(forClass: FAQTests.self).pathForResource("response", ofType: "json")!
        let JSONData = NSData(contentsOfFile: filePath)!
        
        return try! NSJSONSerialization.JSONObjectWithData(JSONData, options: []) as! [String : AnyObject]
    }()
    
    // MARK: XCTestCase
    
    override func setUp()
    {
        super.setUp()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: FAQ
    
    func testFAQSectionBuilding()
    {
        do
        {
            let section = try FAQSection(data: self.JSONData)
            
            // Type
            XCTAssertEqual(section.actionType, FAQSection.ActionType.navigation)
            
            // View controller class
            XCTAssert(section.viewController.isKindOfClass(FAQSectionTableViewController))
            
            // Number of sub sections
            XCTAssertEqual(section.sections!.count, 4)
            
            for subSection in section.sections!
            {
                switch subSection.actionType
                {
                case .navigation:
                    XCTAssert(subSection.viewController.isKindOfClass(FAQSectionTableViewController))
                case .web:
                    XCTAssert(subSection.viewController.isKindOfClass(FAQSectionWebViewController))
                }
            }
        }
        catch
        {
            print(error)
            XCTFail("Caught error \(error)")
        }
    }
}
