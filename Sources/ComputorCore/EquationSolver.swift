//
//  SecondDegreeSolver.swift
//  Computor
//
//  Created by Мишаня on 05.11.2019.
//

import Foundation

public struct EquationSolver {
    var equation: Equation
    
    public init(equation: Equation) {
        self.equation = equation
    }
    
    public func solve() -> String {
        let result: String
        if equation.hasNoSolutions {
            result = "There is no solutions\n" + "0 is not equal \(equation.freeCoeficient)"
            return result
        }
        if equation.solutionIsEveryRealNumber {
            result = "Solution is every number"
            return result
        }
        printEquationDegree()
        if equation.degree == 1 {
            return solveFirstDegreeEquation()
        }
        if equation.degree == 2 {
            return solveSecondDegreeEqation()
        }
        return ""
    }
    
    //MARK: - Degree printing
    private func printEquationDegree() {
        print("Polynomial degree:", equation.degree)
    }
    
    
    
    //MARK: - First Degree Solving
    private func solveFirstDegreeEquation() -> String {
        let solution =  -equation.freeCoeficient / equation.coeficinets[0]
        return "The solution is:\n\(solution)"
    }
    
    
    
    //MARK - Second Degree solving
    private func solveSecondDegreeEqation() -> String {
        let a = equation.coeficinets[1]
        let b = equation.coeficinets[0]
        let c = equation.freeCoeficient
        
        let discriminant = Double(b * b) - Double(4 * a * c)
        
        if discriminant < 0 {
            return "Discriminant is less than zero. There is no solution"
        }
        
        let x1 = (Double(-b) + sqrt(discriminant)) / Double((2 * a))
        let x2 = (Double(-b) - sqrt(discriminant)) / Double((2 * a))
        
        if discriminant == 0 {
            return "Discriminant is less than zero. The only solution is:\n\(x1)"
        }
        return "Discriminant is strictly positive, the two solutions are:\n\(x1)\n\(x2)"
    }
    
    
}
