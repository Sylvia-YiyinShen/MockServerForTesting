//
//  MockServerForTestingUITests.swift
//  MockServerForTestingUITests
//
//  Created by Sylvia Shen on 4/3/19.
//  Copyright © 2019 Sylvia Shen. All rights reserved.
//

import XCTest

class MockServerForTestingUITests: XCTestCase {

    private let app = XCUIApplication()
//    private let mockServer = SwifterServer()
    private let mockServer = EmbassyServer()
    
    override func setUp() {
        super.setUp()
        // TODO: add mock response before launch
        
        /* Embassy Server usage:
         let initialStubs: [HTTPStub] = [
         .failure(path: "/home", statusCode: 400),
         .success(path: "/details", statusCode:200, data: mockDetailsData
         ]
         mockServer.setUp(stubs: initialStubs)
        */
        
        continueAfterFailure = false
        // in production code use MockResponse as toggle to specify the host path and scheme for mock server
        /*
         var scheme: String {
             guard ProcessInfo.processInfo.arguments.contains("MockResponse") == false else {
                return "http://"
             }
         ...
         
         var host: String {
             guard ProcessInfo.processInfo.arguments.contains("MockResponse") == false else {
                return "[::1]:8080" // Embassy
                return "localhost:8080" //Swifter
             }
         ....
         */
        app.launchArguments = ["MockResponse"]
        app.launch()
    }

    override func tearDown() {
        mockServer.tearDown()
        app.terminate()
        super.tearDown()
    }

    func testExample() {
        // possible to change response during test
        /*
         mockServer.setupStub(stub: .success(path: "/home", statusCode:200, data: updatedHomeMockData, delay: 0))
         */
    }

}
