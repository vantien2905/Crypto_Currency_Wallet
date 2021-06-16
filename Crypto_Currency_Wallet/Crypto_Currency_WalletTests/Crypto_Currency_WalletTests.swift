//
//  Crypto_Currency_WalletTests.swift
//  Crypto_Currency_WalletTests
//
//  Created by Tien Dinh on 11/06/2021.
//

import XCTest
@testable import Crypto_Currency_Wallet

class Crypto_Currency_WalletTests: XCTestCase {
    
    var homeVC: HomeViewController!

    override func setUpWithError() throws {
        homeVC = HomeRouter.createModule()
        homeVC.loadViewIfNeeded()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        homeVC = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
