//
//  Equation.swift
//  Computor
//
//  Created by Мишаня on 05.11.2019.
//

import Foundation

public struct Equation {
    let freeCoeficient: Double
    let coeficinets: [Int: Double]
    
    public init(xCoeficients: [Int: Double], freeCoeficient: Double) {
        coeficinets = xCoeficients
        self.freeCoeficient = freeCoeficient
    }
    
    public init() {
        freeCoeficient = 0
        coeficinets = [:]
    }
    
    var hasNoSolutions: Bool {
        return coeficinets.isEmpty && freeCoeficient != 0 ||
            coeficinets.values.allSatisfy({$0 == 0}) && freeCoeficient != 0
    }
    
    var solutionIsEveryRealNumber: Bool {
        return coeficinets.isEmpty && freeCoeficient == 0 ||
        coeficinets.values.allSatisfy({$0 == 0}) && freeCoeficient == 0
    }
    
    var degree: Int {
        var result = 0
        for key in coeficinets.keys {
            if coeficinets[key] != 0 && key > result{
                result = key
            }
        }
        return result
    }
    
    func coeficientForPolynom(with degree: Int) -> Double {
        return degree == 0 ? freeCoeficient : coeficinets[degree, default: 0]
    }
}
