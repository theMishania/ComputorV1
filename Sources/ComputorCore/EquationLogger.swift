//
//  EquationLogger.swift
//  Computor
//
//  Created by Мишаня on 14.11.2019.
//

import Foundation

public struct EquationLogger {
    let equation: Equation
    
    public init(equation: Equation) {
        self.equation = equation
    }
    
    @discardableResult
    public func printEquation() -> String {
        var result = ""
        var firstLoop = true
        let keys = equation.coeficinets.keys.sorted()
        result += "\(equation.freeCoeficient)"
        for key in keys {
            result += formStringFromPolynom(with: key, and: equation.coeficientForPolynom(with: key), isFirst: firstLoop && result.isEmpty)
            firstLoop = false
        }
        result += " = 0"
        print("Reduced form: " + result)
        return result
    }
    
    private func formStringFromPolynom(with degree: Int, and coeficient: Double, isFirst: Bool) -> String {
        guard coeficient != 0 else { return "" }
        let degreeStr = degree == 1 ? "x" : "x^\(degree)"
        if coeficient >= 0 {
            if isFirst {
                return "\(coeficient) * \(degreeStr)"
            } else {
                return " + \(Float(coeficient)) * \(degreeStr)"
            }
        } else {
            if isFirst {
                return "-\(-Float(coeficient)) * \(degreeStr)"
            } else {
                return " - \(-Float(coeficient)) * \(degreeStr)"
            }
        }
    }
}
