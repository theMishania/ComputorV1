import ComputorCore
import Foundation

let commandLineArguments = CommandLine.arguments
if commandLineArguments.count > 2 {
    print("Too many arguments")
    exit(1)
}
if commandLineArguments.count < 2 {
    print("Not enough arguments")
    exit(1)
}
let parser = EquationParser(input: commandLineArguments[1])
let equation = parser.parse()
let solver = EquationSolver(equation: equation)
print(solver.solve())

