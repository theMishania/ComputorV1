//
//  EquationTests.swift
//  ComputorTests
//
//  Created by Мишаня on 05.11.2019.
//

import XCTest
@testable import ComputorCore

class EquationTests: XCTestCase {
    
    var sut: Equation!

    override func setUp() {
        sut = Equation()
    }

    override func tearDown() {
        sut = nil
    }
    
    func testInitCreatesAnEquation() {
        sut = Equation()
        
        XCTAssertNotNil(sut)
    }
    
    func testInitCreateRightCoeficients() {
        sut = Equation(xCoeficients: [1,3,4,5], freeCoeficient: 4)
        
        XCTAssertEqual(sut.coeficinets[0], 1)
        XCTAssertEqual(sut.coeficinets[1], 3)
        XCTAssertEqual(sut.coeficinets[2], 4)
        XCTAssertEqual(sut.coeficinets[3], 5)
        XCTAssertEqual(sut.freeCoeficient, 4)
    }
    
    func testNoCoeficientsAndFreeCoefResultNoSolution() {
        sut = Equation(xCoeficients: [], freeCoeficient: 4)
        
        XCTAssertTrue(sut.hasNoSolutions)
    }
    
    func testAllZerosCoeficientsAndFreeCoefResultNoSolution() {
        sut = Equation(xCoeficients: [0,0,0,0,0], freeCoeficient: 4)
        
        XCTAssertTrue(sut.hasNoSolutions)
    }
    
    func testNoCoeficientsAndZeroFreeDoNotResultNoSolution() {
        sut = Equation(xCoeficients: [], freeCoeficient: 0)
        
        XCTAssertFalse(sut.hasNoSolutions)
    }
    
    func testAllZerosCoefsAndZeroFreeDoNotResultNoSolution() {
        sut = Equation(xCoeficients: [0,0,0,0,0], freeCoeficient: 0)
        
        XCTAssertFalse(sut.hasNoSolutions)
    }
    
    func testAllZeroesCoefsAndZeroFreeCoefResultEveryRealNumberSolution() {
        sut = Equation(xCoeficients: [0,0,0,0,0], freeCoeficient: 0)
        
        XCTAssertTrue(sut.solutionIsEveryRealNumber)
    }
    
    func testNoCoefsAndZeroFreeCoefsResultEveryRealNuumberSolution() {
        sut = Equation(xCoeficients: [], freeCoeficient: 0)
        
        XCTAssertTrue(sut.solutionIsEveryRealNumber)
    }
    
}
