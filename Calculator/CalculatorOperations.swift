//
//  CalculatorOperations.swift
//  Calculator
//
//  Created by Carlos on 30/04/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import Foundation

class CalculatorOperations{

    private enum Operation {
        case Constant (Double)
        case UnaryOperation ((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }

    private var operations: Dictionary<String, Operation> = [
        "√": Operation.UnaryOperation({sqrt($0)}),
        "+": Operation.BinaryOperation({$0 + $1}),
        "-": Operation.BinaryOperation({$0 - $1}),
        "×": Operation.BinaryOperation({$0 * $1}),
        "÷": Operation.BinaryOperation({$0 / $1}),
        "=": Operation.Equals]
    
    private struct PendingBinaryOperation {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }

    private var pending: PendingBinaryOperation?
    private var accumulator = 0.0
    
    public func setOperand(operand: Double){
        accumulator = operand
    }

    public func executeOperation(symbol: String){

        if let operation = operations[symbol] {
            
            switch operation {
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
            case .BinaryOperation(let function):
                executePendingOperation()
                pending = PendingBinaryOperation(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                executePendingOperation()
            }
        }
    }
    
    private func executePendingOperation(){
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
 
    public var resultOperation: Double{
        get{
            return accumulator
        }
    }
    
}
/* Example functions
 
func add(operand1: Double, operand2: Double) -> Double{
    return operand1 * operand2
}

func subtract(operand1: Double, operand2: Double) -> Double{
    return operand1 * operand2
}

func divide(operand1: Double, operand2: Double) -> Double{
    return operand1 * operand2
}


func multiply(operand1: Double, operand2: Double) -> Double{
    return operand1 * operand2
}
*/
