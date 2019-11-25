//
//  EquationParser.swift
//  Computor
//
//  Created by Мишаня on 24.11.2019.
//

import Foundation

extension String {
    subscript (i: Int) -> Character {
      return self[index(startIndex, offsetBy: i)]
    }
}

public class EquationParser {
    var inputString: String
    var coefs = [Int: Double]()
    var freeCoef = 0.0
    
    public init(input: String) {
        inputString = input
    }
    
    @discardableResult
    public func parse() -> Equation {
        var lshEquation: String
        var rhsEquation: String
        
        removeWhitespacesAndTabs()
        (lshEquation, rhsEquation) = devideEquationByEqualSign()
        formatEquationParts(&lshEquation)
        formatEquationParts(&rhsEquation)
        parseEquationPart(part: lshEquation, multipliedBy: 1)
        parseEquationPart(part: rhsEquation, multipliedBy: -1)
        return Equation(xCoeficients: coefs, freeCoeficient: freeCoef)
    }
    
    func formatEquationParts(_ part: inout String) {
        addPlusSignAtStartIndex(to: &part)
        addMissingOnes(to: &part)
    }
    
    func addPlusSignAtStartIndex(to str: inout String) {
        guard str.count > 0 else { return }
        if str[0] == "x" {
            str.insert("+", at: str.startIndex)
        }
    }
    
    func removeWhitespacesAndTabs() {
        inputString = inputString.replacingOccurrences(of: " ", with: "")
        inputString = inputString.replacingOccurrences(of: "\t", with: "")
        inputString = inputString.replacingOccurrences(of: "\n", with: "")
    }
    
    func addMissingOnes(to str: inout String) {
        str = str.replacingOccurrences(of: "-x", with: "-1x")
        str = str.replacingOccurrences(of: "+x", with: "+1x")
    }
    
    func devideEquationByEqualSign() -> (String, String) {
        let equations = inputString.components(separatedBy: "=")
        guard equations.count == 2 else {
            print("Wrong format")
            exit(1)
        }
        return (equations[0], equations[1])
    }
    
    func countAllDegreesIn(equation: String) -> [Int] {
        var result = countFirstDegreeIn(equation: equation)
        let degreesMatches = matches(for: "(?<=\\^)\\d+(?!\\d)", in: inputString)
        
        for degreeString in degreesMatches {
            if let degree = Int(degreeString), !result.contains(degree) {
                result.append(degree)
            }
        }
        return result
    }
    
    func countFirstDegreeIn(equation: String) -> [Int] {
        let xMatches = matches(for: "x(?!\\^)", in: equation)
        return xMatches.count > 0 ? [1] : []
    }
    
    func parseEquationPart(part: String, multipliedBy: Int) {
        var degrees = countAllDegreesIn(equation: part)
        if !degrees.contains(0) {
            degrees.append(0)
        }
        for degree in degrees {
            var match = matches(for: "[^\\^]\\d+(?=\\*x\\^\(degree)|x\\^\(degree))", in: part)
            match += matches(for: "^\\d(?=\\*x\\^\(degree)|x\\^\(degree))", in: part)
            if degree == 0 {
                match += matches(for: "[+-]*(?<!\\^)(?<!\\d)\\d+\\b(?!\\*|x)", in: part)
            }
            if degree == 1 {
                match += matches(for: "[^\\^]\\d+(?=x)(?!x\\^)", in: part)
            }
            let intMatch = match.map { element -> Double in
                if let intElement = Double(element) {
                    return intElement
                } else {
                    print("Wrong format")
                    exit(1)
                }
            }
            let degreeCoefsSum = intMatch.reduce(0, +) * Double(multipliedBy)
            if degree == 0 {
                freeCoef += degreeCoefsSum
            } else {
                if coefs[degree] != nil  {
                    coefs[degree]! += degreeCoefsSum
                } else {
                    coefs[degree] = degreeCoefsSum
                }
            }
        }
    }
    
    private func matches(for regex: String, in text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
