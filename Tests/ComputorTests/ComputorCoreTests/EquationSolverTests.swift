//
//  SecondDegreeSolverTests.swift
//  ComputorTests
//
//  Created by Мишаня on 05.11.2019.
//

import XCTest
@testable import ComputorCore

class EquationSolverTests: XCTestCase {
    
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
        sut = EquationSolver(equation: Equation(xCoeficients: [:], freeCoeficient: 24))
        
        XCTAssertEqual(sut.solve(), "There is no solutions\n" + "0 is not equal 24.0")
    }
    
    func testWhenAllCoefsAreZerosSolverDetectsNoSolution() {
        sut = EquationSolver(equation: Equation(xCoeficients: [1: 0,2: 0,3: 0,4: 0,5: 0,6: 0], freeCoeficient: 100))
        
        XCTAssertEqual(sut.solve(), "There is no solutions\n" + "0 is not equal 100.0")
    }
    
    func testCoefsAreEmptyAndFreeCoefIsZeroResultEveryRealNumberSolution() {
        sut = EquationSolver(equation: Equation(xCoeficients: [:], freeCoeficient: 0))
        
        XCTAssertEqual(sut.solve(), "Solution is every number")
    }
    
    func testZeroCoefsAndZeroFreeCoefResultEveryRealNumberSolution() {
        sut = EquationSolver(equation: Equation(xCoeficients: [1: 0,2: 0,3: 0,4: 0,5: 0,6: 0], freeCoeficient: 0))
        
        XCTAssertEqual(sut.solve(), "Solution is every number")
    }
    
    func testDegreesHigherTanTwoAreNotSupported() {
        sut = EquationSolver(equation: Equation(xCoeficients: [1: 1, 2: 1, 3: 2], freeCoeficient: 0))
        
        XCTAssertEqual(sut.solve(), "The polynomial degree is stricly greater than 2, I can't solve.")
    }
    
    
    
    //MARK: - First Degree Solution Tests
    func testFirstDegreeSolutionWithZeroFreeCoeficient() {
        sut = EquationSolver(equation: Equation(xCoeficients: [1: 1], freeCoeficient: 0))
        
        XCTAssertEqual(sut.solve(), "The solution is:\n0")
    }
    
    func testFirstDegreeSolutionWithSomeNegativeFreeCoeficient() {
        sut = EquationSolver(equation: Equation(xCoeficients: [1: 1], freeCoeficient: -25))
        
        XCTAssertEqual(sut.solve(), "The solution is:\n25.0")
    }
    
    func testFirstDegreeSolutionWithSomePositiveFreeCoeficient() {
        sut = EquationSolver(equation: Equation(xCoeficients: [1: 1], freeCoeficient: 56.8))
        
        XCTAssertEqual(sut.solve(), "The solution is:\n-56.8")
    }
    
    func testFirstDegreeSolutionWithSomeFirstCoeficientNotEqualOne() {
        sut = EquationSolver(equation: Equation(xCoeficients: [1: 2], freeCoeficient: -40))
        
        XCTAssertEqual(sut.solve(), "The solution is:\n20.0")
    }
    
    func testFirstDegreeSolutionWithSomeNegativeFirstCoeficientNotEqualOne() {
        sut = EquationSolver(equation: Equation(xCoeficients: [1: -3], freeCoeficient: 39))
        
        XCTAssertEqual(sut.solve(), "The solution is:\n13.0")
    }
    
    
    //MARK: - Second Degree Solution Tests
    func testSedondDegreeSolutionWithZeroFreeCoeficient() {
        sut = EquationSolver(equation: Equation(xCoeficients: [2: 1], freeCoeficient: 0))
        
        XCTAssertEqual(sut.solve(), "Discriminant is equal to zero. The only solution is:\n0.0")
    }
    
    func testSedondDegreeSolutionWithZeroFreeCoeficientAndZeroFirstDegree() {
        sut = EquationSolver(equation: Equation(xCoeficients: [1: 0, 2: 1], freeCoeficient: 0))
        
        XCTAssertEqual(sut.solve(), "Discriminant is equal to zero. The only solution is:\n0.0")
    }
    
    func testSecondDegreeSolutionWithRightFreeCoeficient() {
        sut = EquationSolver(equation: Equation(xCoeficients: [2: 1], freeCoeficient: -25))
        
        XCTAssertEqual(sut.solve(), "Discriminant is strictly positive, the two solutions are:\n5.0\n-5.0")
    }
    
    func testSecondDegreeSolutionWithWrongFreeCoeficient() {
        sut = EquationSolver(equation: Equation(xCoeficients: [2: 1], freeCoeficient: 25))
        
        XCTAssertEqual(sut.solve(), "Discriminant is less than zero. There is no solution")
    }
    
    func testSecondDegreeWithRightAllCoeficientsAndZeroDescriminant() {
        sut = EquationSolver(equation: Equation(xCoeficients: [2: 1, 1: -6], freeCoeficient: 9))
        
        XCTAssertEqual(sut.solve(), "Discriminant is equal to zero. The only solution is:\n3.0")
    }
    
    func testSecondDegreeWithNegativeDescriminant() {
        sut = EquationSolver(equation: Equation(xCoeficients: [2: 5, 1: 3], freeCoeficient: 7))
        
        XCTAssertEqual(sut.solve(), "Discriminant is less than zero. There is no solution")
    }
    
    func testSecondDegreeWithPositiveDescriminant() {
        sut = EquationSolver(equation: Equation(xCoeficients: [2: 1, 1: -8], freeCoeficient: 12))
        
        XCTAssertEqual(sut.solve(), "Discriminant is strictly positive, the two solutions are:\n6.0\n2.0")
    }
}
