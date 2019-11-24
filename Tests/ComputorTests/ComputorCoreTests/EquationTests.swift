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
        sut = Equation(xCoeficients: [1:1,2:3,3:4,4:5], freeCoeficient: 4)
        
        XCTAssertEqual(sut.coeficinets[1], 1)
        XCTAssertEqual(sut.coeficinets[2], 3)
        XCTAssertEqual(sut.coeficinets[3], 4)
        XCTAssertEqual(sut.coeficinets[4], 5)
        XCTAssertEqual(sut.freeCoeficient, 4)
    }
    
    func testNoCoeficientsAndFreeCoefResultNoSolution() {
        sut = Equation(xCoeficients: [:], freeCoeficient: 4)
        
        XCTAssertTrue(sut.hasNoSolutions)
    }
    
    func testAllZerosCoeficientsAndFreeCoefResultNoSolution() {
        sut = Equation(xCoeficients: [1:0,2:0,3:0,4:0,5:0], freeCoeficient: 4)
        
        XCTAssertTrue(sut.hasNoSolutions)
    }
    
    func testNoCoeficientsAndZeroFreeDoNotResultNoSolution() {
        sut = Equation(xCoeficients: [:], freeCoeficient: 0)
        
        XCTAssertFalse(sut.hasNoSolutions)
    }
    
    func testAllZerosCoefsAndZeroFreeDoNotResultNoSolution() {
        sut = Equation(xCoeficients: [1:0,2:0,3:0,4:0,5:0], freeCoeficient: 0)
        
        XCTAssertFalse(sut.hasNoSolutions)
    }
    
    func testAllZeroesCoefsAndZeroFreeCoefResultEveryRealNumberSolution() {
        sut = Equation(xCoeficients: [1:0,2:0,3:0,4:0,5:0], freeCoeficient: 0)
        
        XCTAssertTrue(sut.solutionIsEveryRealNumber)
    }
    
    func testNoCoefsAndZeroFreeCoefsResultEveryRealNuumberSolution() {
        sut = Equation(xCoeficients: [:], freeCoeficient: 0)
        
        XCTAssertTrue(sut.solutionIsEveryRealNumber)
    }
    
    
    //MARK: - Degree recognitio
    func testWhenNoCoefsAndOnlyFreeCoefResultsInZeroDegree() {
        sut = Equation(xCoeficients: [:], freeCoeficient: 23)
        
        XCTAssertEqual(sut.degree, 0)
    }
    
    func testWhenOneCoefIsGivenEqtionIsFirstDegree() {
        sut = Equation(xCoeficients: [1: 2], freeCoeficient: 23)
        
        XCTAssertEqual(sut.degree, 1)
    }
    
    func testWhenGivenSomeCoefsOfZeroStillDegreeIsFirst() {
        sut = Equation(xCoeficients: [1: 2, 2: 0, 3: 0, 4: 0], freeCoeficient: 100)
        
        XCTAssertEqual(sut.degree, 1)
    }
    
    func testWhenTwoCoefsAreGivenDegreeIsSecond() {
        sut = Equation(xCoeficients: [1: 2,2: 4], freeCoeficient: 100)
        
        XCTAssertEqual(sut.degree, 2)
    }
    
    func testWhenMoveThanTowIsGivenOfZerosStillDegreeIsSecond() {
        sut = Equation(xCoeficients: [1: 2, 2: 4,3: 0,4: 0,5: 0,6: 0], freeCoeficient: 100)
        
        XCTAssertEqual(sut.degree, 2)
    }
    
    func testMoreCoefsAreGiven() {
        sut = Equation(xCoeficients: [1: 2,2: 0,3: 2,4: 0,5: 0,6: 0], freeCoeficient: 100)
        
        XCTAssertEqual(sut.degree, 3)
    }
    
}






















