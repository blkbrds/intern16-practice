//  CalculatorBrain.swift
//  MVC
import Foundation

struct CalculatorBrain {
    var result: Double? {
        didSet {
            if result != nil {
                opera = result
            }
        }
    }
    private var opera: Double?
    private var pendingOperation: PendingBinaryOperation?
    
    //set phep tinh
    mutating func setOpera(_ opera: Double) {
        self.opera = opera
        result = opera
    }
    
    mutating func performOperation(_ symbol: String) {
        //lay gia tri cua phep tinh
        let operation = operations[symbol]!
        
        switch operation {
        case .binary(let function):
            //neu la binary thi luu so da nhap va phep tinh vao
            if opera != nil {
                pendingOperation = PendingBinaryOperation(firstOperand: opera!, operation: function)
                result = nil
            }
        case .equal:
            if pendingOperation != nil && opera != nil {
                result = pendingOperation?.perform(with: opera!)
            }
        }
    }
    
    // luu tru toan tu va hang
    struct PendingBinaryOperation {
        let firstOperand: Double
        let operation: (Double, Double) -> Double
        func perform(with secondOperand: Double) -> Double {
            return operation(firstOperand, secondOperand)
        }
    }
    
    // enum xac dinh cac phep tinh
    enum Operation {
        case binary((Double, Double) -> Double)
        case equal
    }
    
    //gan co dinh cac phep tinh
    var operations: [String: Operation] = [
        "+": .binary(+),
        "−": .binary(-),
        "×": .binary(*),
        "/": .binary(/),
        "=": .equal,
    ]
}
