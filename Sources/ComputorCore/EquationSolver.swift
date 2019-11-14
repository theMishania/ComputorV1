//
//  SecondDegreeSolver.swift
//  Computor
//
//  Created by Мишаня on 05.11.2019.
//

import Foundation

public struct EquationSolver {
    let equation: Equation
    let logger: EquationLogger
    
    public init(equation: Equation) {
        self.equation = equation
        logger = EquationLogger(equation: equation)
    }
    
    public func solve() -> String {
        logger.printEquation()
        printEquationDegree()
        guard equation.degree <= 2 else { return "The polynomial degree is stricly greater than 2, I can't solve." }
        let result: String
        if equation.hasNoSolutions {
            result = "There is no solutions\n" + "0 is not equal \(equation.freeCoeficient)"
            return result
        }
        if equation.solutionIsEveryRealNumber {
            result = "Solution is every number"
            return result
        }
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
        let solution =  -equation.freeCoeficient / equation.coeficientForPolynom(with: 1)
        if solution == 0 {
            return "The solution is:\n0"
        }
        return "The solution is:\n\(solution)"
    }
    
    
    
    //MARK - Second Degree solving
    private func solveSecondDegreeEqation() -> String {
        let a = equation.coeficientForPolynom(with: 2)
        let b = equation.coeficientForPolynom(with: 1)
        let c = equation.coeficientForPolynom(with: 0)
        
        let discriminant = Double(b * b) - Double(4 * a * c)
        
        if discriminant < 0 {
            return "Discriminant is less than zero. There is no solution"
        }
        
        let x1 = (Double(-b) + sqrt(discriminant)) / Double((2 * a))
        let x2 = (Double(-b) - sqrt(discriminant)) / Double((2 * a))
        
        if discriminant == 0 {
            return "Discriminant is equal to zero. The only solution is:\n\(x1)"
        }
        return "Discriminant is strictly positive, the two solutions are:\n\(x1)\n\(x2)"
    }
    
    
}
