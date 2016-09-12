//
//  UITests.swift
//  UITests
//
//  Created by Red Davis on 01/08/2016.
//  Copyright © 2016 GVL. All rights reserved.
//

import XCTest


internal class UITests: XCTestCase
{
    override func setUp()
    {
        super.setUp()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: Tests
    
    func testApplication()
    {
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["How to cook jelly"].tap()
        app.navigationBars["How to cook jelly"].buttons["Cooking FAQ's"].tap()
        tablesQuery.staticTexts["Pasta FAQ's"].tap()
        tablesQuery.staticTexts["Row 1"].tap()
        app.navigationBars["Row 1"].buttons["Pasta FAQ's"].tap()
        tablesQuery.staticTexts["Row 3"].tap()
        app.navigationBars["Row 3"].buttons["Pasta FAQ's"].tap()
        app.navigationBars["Pasta FAQ's"].buttons["Cooking FAQ's"].tap()
        tablesQuery.staticTexts["How to buy pans"].tap()
        app.navigationBars["How to buy pans"].buttons["Cooking FAQ's"].tap()
    }
}
