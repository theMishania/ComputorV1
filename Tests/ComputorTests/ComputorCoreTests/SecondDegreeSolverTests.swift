//
//  SecondDegreeSolverTests.swift
//  ComputorTests
//
//  Created by Мишаня on 05.11.2019.
//

import XCTest
@testable import ComputorCore

class SecondDegreeSolverTests: XCTestCase {
    
    var sut: EquationSolver!

    override func setUp() {
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitCreatesSolver() {
        sut = EquationSolver(equation: Equation())
        
        XCTAssertNotNil(sut)
    }
    
    func testWhenCoefsEmptySolverDetectsNoSolutionCase() {
        sut = EquationSolver(equation: Equation(xCoeficients: [], freeCoeficient: 24))
        
        XCTAssertEqual(sut.solve(), "There is no solutions\n" + "0 is not equal 24.0")
    }
    
    func testWhenAllCoefsAreZerosSolverDetectsNoSolution() {
        sut = EquationSolver(equation: Equation(xCoeficients: [0,0,0,0,0,0], freeCoeficient: 100))
        
        XCTAssertEqual(sut.solve(), "There is no solutions\n" + "0 is not equal 100.0")
    }
    
    func testCoefsAreEmptyAndFreeCoefIsZeroResultEveryRealNumberSolution() {
        sut = EquationSolver(equation: Equation(xCoeficients: [], freeCoeficient: 0))
        
        XCTAssertEqual(sut.solve(), "Solution is every number")
    }
    
    func testZeroCoefsAndZeroFreeCoefResultEveryRealNumberSolution() {
        sut = EquationSolver(equation: Equation(xCoeficients: [0,0,0,0,0,0], freeCoeficient: 0))
        
        XCTAssertEqual(sut.solve(), "Solution is every number")
    }
    
}
