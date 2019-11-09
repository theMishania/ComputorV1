import ComputorCore

print("The Equation")
print("x^2 - 2x - 3 = 0")
var equation = Equation(xCoeficients: [-2, 1], freeCoeficient: -3)
var equationSolver = EquationSolver(equation: equation)
print(equationSolver.solve())


print("\n")
print("The Equation")
print("15 − 2x − x^2 = 0")
equation = Equation(xCoeficients: [-2, -1], freeCoeficient: 15)
equationSolver = EquationSolver(equation: equation)
print(equationSolver.solve())


print("\n")
print("The Equation")
print("x^2 − 8x + 12 = 0")
equation = Equation(xCoeficients: [-8, 1], freeCoeficient: 12)
equationSolver = EquationSolver(equation: equation)
print(equationSolver.solve())


print("\n")
print("The Equation")
print("5x^2 + 3x + 7 = 0")
equation = Equation(xCoeficients: [3, 5], freeCoeficient: 7)
equationSolver = EquationSolver(equation: equation)
print(equationSolver.solve())


print("\n")
print("The Equation")
print("x^2 − 6x + 9 = 0")
equation = Equation(xCoeficients: [-6, 1], freeCoeficient: 9)
equationSolver = EquationSolver(equation: equation)
print(equationSolver.solve())


print("\n")
print("The Equation")
print("x^2 − 6x + 9 = 0")
equation = Equation(xCoeficients: [-6, 1], freeCoeficient: 9)
equationSolver = EquationSolver(equation: equation)
print(equationSolver.solve())


print("\n")
print("The Equation")
print("x^2 − 25 = 0")
equation = Equation(xCoeficients: [0, 1], freeCoeficient: -25)
equationSolver = EquationSolver(equation: equation)
print(equationSolver.solve())


print("\n")
print("The Equation")
print("x^2 − 25 = 0")
equation = Equation(xCoeficients: [0, 1], freeCoeficient: 25)
equationSolver = EquationSolver(equation: equation)
print(equationSolver.solve())

print("\n")
print("The Equation")
print("x^2 − 25 = 0")
equation = Equation(xCoeficients: [0, 1], freeCoeficient: -24)
equationSolver = EquationSolver(equation: equation)
print(equationSolver.solve())


print("\n")
print("The Equation")
print("x − 25 = 0")
equation = Equation(xCoeficients: [1], freeCoeficient: -25)
equationSolver = EquationSolver(equation: equation)
print(equationSolver.solve())

print("\n")
print("The Equation")
print("25 = 0")
equation = Equation(xCoeficients: [0,0,0,0,0], freeCoeficient: 25)
equationSolver = EquationSolver(equation: equation)
print(equationSolver.solve())
