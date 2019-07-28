//
//  IOSUnitTestsTests.swift
//  IOSUnitTestsTests
//
//  Created by Carlos on 30/05/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import XCTest
@testable import IOSUnitTests

class IOSUnitTestsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPesoBajo() {
        let modeloIMC = ModeloIMC()
        modeloIMC.peso = 50
        modeloIMC.estatutra = 1.7
        
        XCTAssertEqual(modeloIMC.calcularIMC(), 17.30, "Peso bajo correcto")
        
    }
    
    func testPesoNormal() {
        let modeloIMC = ModeloIMC()
        modeloIMC.peso = 60
        modeloIMC.estatutra = 1.7
        
        XCTAssertEqual(modeloIMC.calcularIMC(), 20.76, "Peso normal correcto")
        
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
