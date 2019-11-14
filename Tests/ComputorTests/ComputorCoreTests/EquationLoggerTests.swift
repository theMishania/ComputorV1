//
//  EquationLoggerTests.swift
//  ComputorTests
//
//  Created by Мишаня on 14.11.2019.
//

import XCTest
@testable import ComputorCore

class EquationLoggerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testGoodOutputWithZeroDegreeAndZeroFreeCoeficient() {
        let equation = Equation(xCoeficients: [:], freeCoeficient: 0)
        let sut = EquationLogger(equation: equation)
        
        XCTAssertEqual(sut.printEquation(), "0.0 = 0")
    }
    
    func testGoodOutputWithZeroDegreeAndNotZeroFreeCoeficient() {
        let equation = Equation(xCoeficients: [:], freeCoeficient: 6)
        let sut = EquationLogger(equation: equation)
        
        XCTAssertEqual(sut.printEquation(), "6.0 = 0")
    }
    
    func testGoodOutputWithFirstoDegreeAndZeroFreeCoeficient() {
        let equation = Equation(xCoeficients: [1: 0], freeCoeficient: 0)
        let sut = EquationLogger(equation: equation)
        
        XCTAssertEqual(sut.printEquation(), "0.0 = 0")
    }
    
    func testGoodOutputWithFirstoDegreeAndNotZeroFreeCoeficient() {
        let equation = Equation(xCoeficients: [1: 0], freeCoeficient: 976)
        let sut = EquationLogger(equation: equation)
        
        XCTAssertEqual(sut.printEquation(), "976.0 = 0")
    }
    
    func testNegativeFreeCoef() {
        let equation = Equation(xCoeficients: [1: 0], freeCoeficient: -976)
        let sut = EquationLogger(equation: equation)
        
        XCTAssertEqual(sut.printEquation(), "-976.0 = 0")
    }
    
    func testOutputWithFirstNotZeroDegreeAndZeroFreeCoef() {
        let equation = Equation(xCoeficients: [1: 6], freeCoeficient: 0)
        let sut = EquationLogger(equation: equation)
        
        XCTAssertEqual(sut.printEquation(), "0.0 + 6.0 * x = 0")
    }
    
    func testFirstDegreeWithNegativeCoef() {
        let equation = Equation(xCoeficients: [1: -6], freeCoeficient: 0)
        let sut = EquationLogger(equation: equation)
        
        XCTAssertEqual(sut.printEquation(), "0.0 - 6.0 * x = 0")
    }
    
    func testWithFirstDegreeAndNotZeroFreeCoef() {
        let equation = Equation(xCoeficients: [1: 1], freeCoeficient: 45)
        let sut = EquationLogger(equation: equation)
        
        XCTAssertEqual(sut.printEquation(), "45.0 + 1.0 * x = 0")
    }
    
    func testSecondDegreeWithZeroFirstDegree() {
        let equation = Equation(xCoeficients: [2: 5, 1: 0], freeCoeficient: 9)
        let sut = EquationLogger(equation: equation)
        
        XCTAssertEqual(sut.printEquation(), "9.0 + 5.0 * x^2 = 0")
    }
    
    func testSecondDegreeWithNotZeroFirstDegree() {
        let equation = Equation(xCoeficients: [2: 50, 1: -110], freeCoeficient: 19)
        let sut = EquationLogger(equation: equation)
        
        XCTAssertEqual(sut.printEquation(), "19.0 - 110.0 * x + 50.0 * x^2 = 0")
    }
    
    func testEnormousDegree() {
        let equation = Equation(xCoeficients: [10: 4, 3: 3, 2: 50, 1: -110], freeCoeficient: 19)
        let sut = EquationLogger(equation: equation)
        
        XCTAssertEqual(sut.printEquation(), "19.0 - 110.0 * x + 50.0 * x^2 + 3.0 * x^3 + 4.0 * x^10 = 0")
    }
    
}
