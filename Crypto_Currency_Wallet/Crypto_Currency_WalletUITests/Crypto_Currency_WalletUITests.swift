//
//  Crypto_Currency_WalletUITests.swift
//  Crypto_Currency_WalletUITests
//
//  Created by Tien Dinh on 11/06/2021.
//

import XCTest

class Crypto_Currency_WalletUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testUTC01SearchView() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let searchButton = app.buttons["searchButton"]
        let favoriteButton = app.buttons["favoriteButton"]
        let textfield = app.textFields["searchTextField"]
        
        XCTAssertTrue(searchButton.exists)
        XCTAssertTrue(favoriteButton.exists)
        XCTAssertTrue(textfield.exists)
        
        favoriteButton.tap()
        XCTAssertTrue(app.staticTexts["Favorite"].exists)
        XCTAssertFalse(textfield.exists)
        
        searchButton.tap()
        XCTAssertTrue(textfield.exists)
        XCTAssertFalse(app.staticTexts["Favorite"].exists)
        
        textfield.tap()
        textfield.typeText("not Have Coin This Name")
        let label = app.staticTexts["Empty data"]
        XCTAssertTrue(label.exists)
    }
    
    func testUTC02ShowNotInternet() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.staticTexts["Open setting"].exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
