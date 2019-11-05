//
//  SecondDegreeSolver.swift
//  Computor
//
//  Created by Мишаня on 05.11.2019.
//

import Foundation

struct SecondDegreeSolver {
    var equation: Equation
    
    func solve() -> String {
        let result: String
        if equation.hasNoSolutions {
            result = "There is no solutions\n" + "0 is not equal \(equation.freeCoeficient)"
            return result
        }
        if equation.solutionIsEveryRealNumber {
            result = "Solution is every number"
            return result
        }
        return ""
    }
}
