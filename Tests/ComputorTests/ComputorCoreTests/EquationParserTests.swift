//
//  EquationParserTests.swift
//  ComputorTests
//
//  Created by Мишаня on 24.11.2019.
//

import XCTest
@testable import ComputorCore

class EquationParserTests: XCTestCase {
    
    func testInitWithInputCreatesInstanceWithThisInput() {
        let sut = EquationParser(input: "Foo")
        
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.inputString, "Foo")
    }
    
    func testRemoveWhateSpacsWorksAsExpected() {
        let sut = EquationParser(input: "2 * x + 10 =   45 -    67 * x")
        
        sut.removeWhitespacesAndTabs()
        
        XCTAssertEqual(sut.inputString, "2*x+10=45-67*x")
    }
    
    func testDevideFuncSplitsEquationOnTwoParts() {
        let sut = EquationParser(input: "245x-60=142x^2+143-295x")
        
        let equationParts = sut.devideEquationByEqualSign()
        
        XCTAssertEqual(equationParts.0, "245x-60")
        XCTAssertEqual(equationParts.1, "142x^2+143-295x")
    }
    
    func testFirstDegreeIsMatchesWithJustX() {
        var sut = EquationParser(input: "452-23=65")
        
        XCTAssertEqual(sut.countFirstDegreeIn(equation: "452-23=65"), [])
        
        sut = EquationParser(input: "452-23x=65")
        
        XCTAssertEqual(sut.countFirstDegreeIn(equation: "452-23x=65"), [1])
        
        sut = EquationParser(input: "23-65x")
        
        XCTAssertEqual(sut.countFirstDegreeIn(equation: "23-65x"), [1])
    }
    
    func testCountDegreesInNoDegreesEquationsResultsInEmptyDegrees() {
        let sut = EquationParser(input: "Foo")
        
        let degrees = sut.countAllDegreesIn(equation: "23")
        
        XCTAssertEqual(degrees, [])
    }
    
    func testCountDegreesInFirstDegreeEquation() {
        let equation = "12 - 65x"
        let sut = EquationParser(input: equation)
        
        let degrees = sut.countAllDegreesIn(equation: equation)
        
        XCTAssertEqual(degrees, [1])
    }
    
    func testCountDegreeInFirstDegreeWithSymbolEquation() {
        let equation = "126*x^1-100"
        let sut = EquationParser(input: equation)
        
        let degrees = sut.countAllDegreesIn(equation: equation)
        
        XCTAssertEqual(degrees, [1])
    }
    
    func testCountDegreesInOnlySecondDegreeEquation() {
        let equation = "126*x^2-100"
        let sut = EquationParser(input: equation)
        
        let degrees = sut.countAllDegreesIn(equation: equation)
        
        XCTAssertEqual(degrees, [2])
    }
    
    func testDegreesInFirstAndSecondDegreeEquation() {
        let equation = "126*x^2-100x^1+100x^2+100x^1"
        let sut = EquationParser(input: equation)
        
        let degrees = sut.countAllDegreesIn(equation: equation)
        
        XCTAssertEqual(degrees, [2, 1])
    }
    
    func testMultipleDefferentDegrees() {
        let equation = "x^5+19x^3-x+63x^2-1000x^50"
        let sut = EquationParser(input: equation)
        
        let degrees = sut.countAllDegreesIn(equation: equation)
        
        XCTAssertEqual(degrees, [1, 5, 3, 2, 50])
    }
    
    
    
    
    
    
    
    //MARK: - Whole Parsing Testing
    
    
    
    
    
    //MARK: - Zero Degree Equation Parsing
    func testZeroDegreeWithoutX() {
        let sut = EquationParser(input: "45-2=35")
        
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, 8)
    }
    
    func testZeroDegreeWithoutXWithMoreComplex() {
        let sut = EquationParser(input: "-2000 + 65 + 356 =4000-578")
        
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, -5001)
    }
    
    func testZeroDegreeWithXInDegreeOfZero() {
        let sut = EquationParser(input: "10-56*x^0=20+40x^0")
        
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, -106)
        XCTAssertEqual(sut.coefs.count, 0)
    }
    
    func testZeroDegreeWithXInDegreeOfZeroWithNoCoefBefore() {
        let sut = EquationParser(input: "4 +x^0 = 6 - x^0")
        
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, 0)
    }
    
    func testZeroDegreeWithInDegreeOfZeroInMoreComplexEquation() {
        let sut = EquationParser(input: "56*x^0 + 2     -5x^0 = 45x^0 + 4 - 67 + 4")
        
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, 67)
    }
    
    func testZeroDegreeWithFirstCoefsAtTheBeginningOfTheEquationParts() {
        let sut = EquationParser(input: "3x^0 + 45 = 4x^0 + 16")
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, 28.0)
    }
    
    func testZeroDegreeWithOneCoefAtEachSide() {
        let sut = EquationParser(input: "x^0 = 5")
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, -4)
    }
    
    //MARK: - First Degree Equation Parsing
    func testSimpleEquationParsing() {
        let sut = EquationParser(input: "45-2*x^1=35")
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, 10.0)
        XCTAssertEqual(sut.coefs.count, 1)
        XCTAssertEqual(sut.coefs[1], -2)
    }
    
    func testFirstDegreeWithZeroDegreeCoefs() {
        let sut = EquationParser(input: "3x^0 + x^1 + 45 = 4x^0 + -5*x^1 + 16")
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, 28.0)
        XCTAssertEqual(sut.coefs.count, 1)
        XCTAssertEqual(sut.coefs[1], 6)
    }
    
    func testfirstDegreeWithMoreComplexForm() {
        let sut = EquationParser(input: "3x^0 + x^1 + 45 - 4 * x^1 = 4x^0 + -5*x^1 + 16 -100 + x^1")
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, 128.0)
        XCTAssertEqual(sut.coefs.count, 1)
        XCTAssertEqual(sut.coefs[1], 1)
    }
    
    func testFirstDegreeWhenCoefsInTeBeginingOfTheEquationParts() {
        let sut = EquationParser(input: "4x^0 = 5x^1 - 10 + 56 * x^1")
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, 14)
        XCTAssertEqual(sut.coefs.count, 1)
        XCTAssertEqual(sut.coefs[1], -61)
    }
    
    //MARK: - Second Degree Parsing
    func testSecondDegreeWithoutAnyOther() {
        let sut = EquationParser(input: "4x^2 = 0")
        
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, 0)
        XCTAssertEqual(sut.coefs.count, 1)
        XCTAssertEqual(sut.coefs[2], 4)
    }
    
    func testSecondDegreeWithZeroDegreeCoefs() {
        let sut = EquationParser(input: "-5x^0 + x^2 = 7")
        
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, -12)
        XCTAssertEqual(sut.coefs.count, 1)
        XCTAssertEqual(sut.coefs[2], 1)
    }
    
    func testMultipleSecondDegreeWithZeroCoefs() {
        let sut = EquationParser(input: "-5x^0 + x^2 = 7 - 4* x^2 + 27 - 100x^0")
        
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, 61)
        XCTAssertEqual(sut.coefs.count, 1)
        XCTAssertEqual(sut.coefs[2], 5)
    }
    
    func testSecondDegreeAndOthersDegreeLowerThanSecond() {
        let sut = EquationParser(input: "x^2=x^1 - x^2 + 15 - 34x^0 + 35x^2 - 64x^1)")
        
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, 19)
        XCTAssertEqual(sut.coefs.count, 2)
        XCTAssertEqual(sut.coefs[1], 63)
        XCTAssertEqual(sut.coefs[2], -33)
    }
    
    func testOnlySecondDegree() {
        let sut = EquationParser(input: "x^2=x^2")
        
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, 0)
        XCTAssertEqual(sut.coefs.count, 1)
        XCTAssertEqual(sut.coefs[2], 0)
    }
    
    //MARK: - Higher Degrees Parsing
    func testThirdDegreeOnly() {
        let sut = EquationParser(input: "x^3=0")
        
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, 0)
        XCTAssertEqual(sut.coefs.count, 1)
        XCTAssertEqual(sut.coefs[3], 1)
    }
    
    func testThirdDegreeWithOthersLower() {
        let sut = EquationParser(input: "45x^3 - 2x^2 + 10 = x^0 - 35 + 4 * x ^ 1 -15x^3")
        
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, 44)
        XCTAssertEqual(sut.coefs.count, 3)
        XCTAssertEqual(sut.coefs[1], -4)
        XCTAssertEqual(sut.coefs[2], -2)
        XCTAssertEqual(sut.coefs[3], 60)
    }
    
    func testFourthDegreeOnlyTest() {
        let sut = EquationParser(input: "-x^4=24")
        
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, -24)
        XCTAssertEqual(sut.coefs.count, 1)
        XCTAssertEqual(sut.coefs[4], -1)
    }
    
    func testFourthAndLowerDegrees() {
        let sut = EquationParser(input: "x^4 - x^3 + 5*x^3 = x^2 - x^1 + 45*x^0 - 15 - 14 * x^4")
        
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, -30)
        XCTAssertEqual(sut.coefs.count, 4)
        XCTAssertEqual(sut.coefs[1], 1)
        XCTAssertEqual(sut.coefs[2], -1)
        XCTAssertEqual(sut.coefs[3], 4)
        XCTAssertEqual(sut.coefs[4], 15)
    }
    
    func testDefferentDegrees() {
        let sut = EquationParser(input: "x^210 = 150 - x^1")
        
        sut.parse()
        
        XCTAssertEqual(sut.freeCoef, -150)
        XCTAssertEqual(sut.coefs.count, 2)
        XCTAssertEqual(sut.coefs[210], 1)
    }
}
