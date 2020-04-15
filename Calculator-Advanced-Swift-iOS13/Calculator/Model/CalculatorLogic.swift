//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Chidinma Umenwofor-Nweze on 2020-04-14.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (firstNumber: Double, calcMethod: String)? //optional tuple
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(_ symbol: String) -> Double? {
        if let n = number {
            
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalculation(secondNumber: n)
            default:
                intermediateCalculation = (firstNumber: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(secondNumber: Double) -> Double? {
        
        if let firstNumber = intermediateCalculation?.firstNumber,
            let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return firstNumber + secondNumber
            case "-":
                return firstNumber - secondNumber
            case "×":
                return firstNumber * secondNumber
            case "÷":
                return firstNumber / secondNumber
            default:
                fatalError("The operation passed in does not match any of the cases")
            }
        }
        return nil
    }
    
}

