//
//  Equation.swift
//  Computor
//
//  Created by Мишаня on 05.11.2019.
//

import Foundation

class Equation {
    let freeCoeficient: Int
    let coeficinets: [Int]
    
    public init(xCoeficients: [Int], freeCoeficient: Int) {
        coeficinets = xCoeficients
        self.freeCoeficient = freeCoeficient
    }
    
    public init() {
        freeCoeficient = 0
        coeficinets = []
    }
    
    var hasNoSolutions: Bool {
        return coeficinets.isEmpty && freeCoeficient != 0 ||
        coeficinets.allSatisfy({$0 == 0}) && freeCoeficient != 0
    }
    
    var solutionIsEveryRealNumber: Bool {
        return coeficinets.isEmpty && freeCoeficient == 0 ||
        coeficinets.allSatisfy({$0 == 0}) && freeCoeficient == 0
    }
}
