//
//  CitibanamexTests.swift
//  CitibanamexTests
//
//  Created by Hector Climaco on 10/03/21.
//

import XCTest
@testable import Citibanamex

class CitibanamexTests: XCTestCase {
  
  private var expectation:XCTestExpectation!
  
  let services = ServicesManager()
  private let customInterval:TimeInterval =  60
  
  override func setUpWithError() throws {
    expectation = self.expectation(description: "waitingRespons")
    configuereService()
  }
  
  func testGetTransactions() {
    services.getTransactions(loadFromFile:false) { (response, error) in
      if error != nil {
        XCTAssert(false, "getTransactions fue incorrecto")
        self.expectation.fulfill()
      } else {
        print("Response", String(describing: response))
        XCTAssert(true, "getTransactions fue correcto")
        self.expectation.fulfill()
      }
    }
    waitForExpectations(timeout: customInterval, handler: nil)
  }
  
  func configuereService() {
    services.showLoading = {
      print("Show loading")
    }
    
    services.hideLoading = {
      print("Show hideloading")
    }
    
  }
}
