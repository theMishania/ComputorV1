//
//  SecondDegreeSolverTests.swift
//  ComputorTests
//
//  Created by Мишаня on 05.11.2019.
//

import XCTest
@testable import ComputorCore

class SecondDegreeSolverTests: XCTestCase {
    
    var sut: SecondDegreeSolver!

    override func setUp() {
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitCreatesSolver() {
        sut = SecondDegreeSolver(equation: Equation())
        
        XCTAssertNotNil(sut)
    }
    
    func testWhenCoefsEmptySolverDetectsNoSolutionCase() {
        sut = SecondDegreeSolver(equation: Equation(xCoeficients: [], freeCoeficient: 24))
        
        XCTAssertEqual(sut.solve(), "There is no solutions\n" + "0 is not equal 24")
    }
    
    func testWhenAllCoefsAreZerosSolverDetectsNoSolution() {
        sut = SecondDegreeSolver(equation: Equation(xCoeficients: [0,0,0,0,0,0], freeCoeficient: 100))
        
        XCTAssertEqual(sut.solve(), "There is no solutions\n" + "0 is not equal 100")
    }
    
    func testCoefsAreEmptyAndFreeCoefIsZeroResultEveryRealNumberSolution() {
        sut = SecondDegreeSolver(equation: Equation(xCoeficients: [], freeCoeficient: 0))
        
        XCTAssertEqual(sut.solve(), "Solution is every number")
    }
    
    func testZeroCoefsAndZeroFreeCoefResultEveryRealNumberSolution() {
        sut = SecondDegreeSolver(equation: Equation(xCoeficients: [0,0,0,0,0,0], freeCoeficient: 0))
        
        XCTAssertEqual(sut.solve(), "Solution is every number")
    }
    
}
